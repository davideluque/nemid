require 'nokogiri'

module NemID
  module XMLDSig
    class Document < Xmldsig::SignedDocument
      def initialize(document, options = {})
        super
        @store = OpenSSL::X509::Store.new
        @user_certificate = nil
        extract_and_store_certificates
      end

      def extract_pid_or_rid
        return @user_certificate.subject.to_a.assoc("serialNumber")[1]
      end

      def get_user_certificate
        return @user_certificate
      end

      def validate_certificate_chain
        @store.verify(@user_certificate)
      end
      
      def validate_signature
        validate(@user_certificate)
      end
      
      private
      def certificates
        xpath = '//ds:KeyInfo/ds:X509Data/ds:X509Certificate'
        document.xpath(xpath, NAMESPACES).each
      end

      def extract_and_store_certificates
        certificates.each do |element|
          cert = x509_certificate(Base64.decode64(element.text))
          cert_key_usage = cert.find_extension('keyUsage').value
          
          if (cert_key_usage =~ /Digital Signature/)
            @user_certificate = cert
          else
            @store.add_cert(cert)
          end
        end
      end

      def x509_certificate(raw)
        OpenSSL::X509::Certificate.new(raw)
      end
    end
  end
end