require 'base64'
require 'openssl'

module NemID
 class Crypto
  
  def initialize(certificate, pass)
    certificate = read_file(certificate)
    @pkcs12 = read_pkcs12(certificate, pass)
  end

  def base64_encoded_der_representation
    Base64.strict_encode64(@pkcs12.certificate.to_der)
  end

  private
  def read_file(certificate)
    File.read(certificate)
  end

  def read_pkcs12(certificate, pass)
    OpenSSL::PKCS12::new(certificate, pass)
  end
 end
end
