require 'nokogiri'

module NemID
  module XMLDSig
    class Document < Xmldsig::SignedDocument

      def extract_pid_or_rid
        @user_certificate ||= get_user_certificate
        return user_certificate.subject.to_a.assoc("serialNumber")[1]
      end

      def get_user_certificate
        certificates.each do |element|
          cert = x509_certificate(Base64.decode64(element.text))
          cert_key_usage = cert.find_extension('keyUsage').value
          
          return cert if (cert_key_usage =~ /Digital Signature/)
        end
      end
      
      def validate_signature
        @user_certificate ||= get_user_certificate
        validate(@user_certificate)
      end
      
      private
      def certificates
        xpath = '//ds:KeyInfo/ds:X509Data/ds:X509Certificate'
        document.xpath(xpath, NAMESPACES).each
      end

      def x509_certificate(raw)
        OpenSSL::X509::Certificate.new(raw)
      end
    end
  end
end