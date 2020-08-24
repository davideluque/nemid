require 'net/http'
require 'uri'

module NemID
  module OCSP
    def self.request(issuer, intermediate, subject)
      digest = OpenSSL::Digest::SHA1.new
      certificate_id = OpenSSL::OCSP::CertificateId.new(subject, issuer, digest)

      request = OpenSSL::OCSP::Request.new
      request.add_certid(certificate_id)
      request.add_nonce
      
      ocsp_uris = subject.ocsp_uris
      ocsp_uri = URI ocsp_uris[0]

      http_response = Net::HTTP.start ocsp_uri.hostname do |http|
        http.post ocsp_uri.path, request.to_der,
        'content-type' => 'application/ocsp-request'
      end

      response = OpenSSL::OCSP::Response.new http_response.body
      response_basic = response.basic

      puts response_basic

      #puts "valid sig"
      #return false if !response_has_valid_signature?(response_basic, issuer, intermediate, subject)
      
      single_response = response_basic.find_response(certificate_id)

      return false if !response_has_status_and_is_valid?(single_response)

      return false if request.check_nonce(response_basic) == 0

      return cert_status(single_response)
    end

    private
    def self.cert_status(single_response)
      case single_response.cert_status
      when OpenSSL::OCSP::V_CERTSTATUS_GOOD
        return true
      when OpenSSL::OCSP::V_CERTSTATUS_REVOKED
        return false
      when OpenSSL::OCSP::V_CERTSTATUS_UNKNOWN
        return false
      end
    end

    def self.check_validity(single_response)
      unless single_response.check_validity
        return false
      end
      
      return true
    end

    def self.response_has_status_and_is_valid?(single_response)
      unless single_response
        return false
      end

      return check_validity(single_response)
    end

    def self.response_has_valid_signature?(response_basic, issuer, intermediate, subject)
      store = OpenSSL::X509::Store.new
      store.add_cert(subject)
      store.add_cert(intermediate)
      store.add_cert(issuer)

      unless response_basic.verify [intermediate], store then
        return false
      end

      return true
    end
  end
end