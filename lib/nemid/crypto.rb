module NemID
 class Crypto
  def initialize(certificate, pass)
    @certificate = certificate
    @pass = pass
  end

  def read_certificate
    File.read(@certificate)
  end
 end
end
