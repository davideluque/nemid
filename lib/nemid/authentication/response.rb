module NemID
  module Authentication
    class Response
      PID_REGEX = /\APID:([0-9-]+)\Z/.freeze
      RID_REGEX = /\ARID:([0-9-]+)\Z/.freeze
    
      def initialize(string)
        if string.start_with? '<?xml'
          @doc = NemID::XMLDSig::Document.new(string)
        elsif string.match?(/\A[A-Za-z0-9+\/\r\n]+={0,2}\z/)
          @doc = NemID::XMLDSig::Document.new(Base64.decode64(string))
        else
          raise NemID::Authentication::ResponseError
        end
      end

      def extract_pid
        if has_pid?
          serial_number.match(PID_REGEX)[1]
        end
      end

      def extract_rid
        if has_rid?
          serial_number.match(RID_REGEX)[1]
        end
      end

      def extract_pid_or_rid
        serial_number
      end

      def has_pid?
        serial_number.match?(PID_REGEX)
      end

      def has_rid?
        serial_number.match?(RID_REGEX)
      end

      def user_certificate_expired?
        @doc.user_certificate_expired?
      end

      def user_certificate_revoked?
        @doc.user_certificate_revoked?
      end

      def validate_certificate_chain
        @doc.validate_certificate_chain
      end

      def validate_response
        validate_signature && validate_certificate_chain && 
        !user_certificate_expired? && !user_certificate_revoked?    
      end

      def validate_signature
        @doc.validate_signature
      end

      private
      def serial_number
        @serial_number ||= @doc.extract_pid_or_rid
      end
    end
  end
end