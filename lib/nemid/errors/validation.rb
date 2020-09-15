module NemID
  module Errors
    class ResponseValidationError < ResponseError ; end

    class InvalidSignature < ResponseValidationError
      def initialize(
        msg = "Invalid signature in the XML Document. Data might be altered."
      )
      super(msg)
      end
    end

    class InvalidCertificateChain < ResponseValidationError
      def initialize(msg = "Invalid certificate chain.")
        super(msg)
      end
    end

    class UserCertificateExpired < ResponseValidationError
      def initialize(msg = "User certificate has expired.")
        super(msg)
      end
    end

    class UserCertificateRevoked < ResponseValidationError
      def initialize(msg = "User certificate has been revoked by CA.")
        super(msg)
      end
    end
  end
end