require 'net/http'
require 'uri'

module NemID
  module OCSP
    def self.request(subject, issuer)
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
    end
  end
end