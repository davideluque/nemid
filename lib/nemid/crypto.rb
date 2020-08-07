require 'base64'
require 'openssl'

module NemID
 class Crypto
  
  def initialize(certificate, pass)
    certificate = read_file(certificate)
    @pkcs12 = read_pkcs12(certificate, pass)
    @rsa_instance = rsa_keypair(@pkcs12, pass)
  end

  def base64_encoded_der_representation
    Base64.strict_encode64(@pkcs12.certificate.to_der)
  end

  def base64_encoded_digest_representation(data)
    Base64.strict_encode64(digest(data))
  end

  def base64_encoded_rsa_signature(data)
    Base64.strict_encode64(sign(data))
  end

  private
  def digest(data)
    OpenSSL::Digest::SHA256.new.digest(data)
  end

  def read_file(certificate)
    File.read(certificate)
  end

  def read_pkcs12(certificate, pass)
    OpenSSL::PKCS12::new(certificate, pass)
  end

  def rsa_keypair(pkcs12, passphrase)
    OpenSSL::PKey::RSA.new(pkcs12.key, passphrase)
  end

  def sign(data)
    @rsa_instance.sign(OpenSSL::Digest::SHA256.new, data)
  end
 end
end
