module NemID
  module Errors
    class ValidationError < ResponseError ; end

    class InvalidSignature < ValidationError ; end

    class InvalidCertificateChain < ValidationError ; end

    class UserCertificateExpired < ValidationError ; end

    class UserCertificateRevoked < ValidationError ; end
  end
end