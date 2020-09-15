module NemID
  module OCSP
    class Error < StandardError ; end
    
    class InvalidSignatureError < Error
      def initialize(msg='Response is not signed by a trusted certificate')
        super(msg)
      end
    end

    class NoStatusError < Error
      def initialize(msg='basic_response does not have the status for the certificate')
        super(msg)
      end
    end

    class InvalidUpdateError < Error
      def initialize(msg='this_update is in the future or next_update time has passed')
        super(msg)
      end
    end

    class NonceError < Error
      def initialize(msg='Nonces both present and not equal')
        super(msg)
      end
    end
  end
end