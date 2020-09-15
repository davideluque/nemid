module NemID
  module Errors
    class ResponseValidationError < ResponseError ; end

    class InvalidSignature < ResponseValidationError ; end

    class InvalidCertificateChain < ResponseValidationError ; end

    class UserCertificateExpired < ResponseValidationError ; end

    class UserCertificateRevoked < ResponseValidationError ; end
  end
end