require 'openssl'

module NemID
 class Crypto

  def initialize(cert:, key:)
    @certificate = read_x509(cert)
    @rsa_instance = rsa_keypair(key)
  end

  def base64_encoded_der_representation
    Base64.strict_encode64(@certificate.to_der)
  end

  def base64_encoded_digest_representation(data)
    Base64.strict_encode64(digest(data))
  end

  def base64_encoded_rsa_signature(data)
    Base64.strict_encode64(sign(data))
  end

  def get_certificate
    @certificate
  end

  def get_key
    @rsa_instance
  end
  
  private
  def digest(data)
    OpenSSL::Digest::SHA256.new.digest(data)
  end

  def read_file(certificate)
    File.read(certificate)
  end

  def read_x509(raw)
    OpenSSL::X509::Certificate.new(raw)
  end

  def rsa_keypair(raw)
    OpenSSL::PKey::RSA.new(raw)
  end

  def sign(data)
    @rsa_instance.sign(OpenSSL::Digest::SHA256.new, data)
  end
 end
end
