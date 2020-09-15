module NemID
  module Authentication
    class Response
      PID_REGEX = /\APID:([0-9-]+)\Z/.freeze
      RID_REGEX = /\ARID:([0-9-]+)\Z/.freeze

      def initialize(string)
        if string.match?(/\A[A-Za-z0-9+\/\r\n]+={0,2}\z/)
          decoded_string = Base64.decode64(string)
          if decoded_string.start_with? '<?xml'
            @doc = NemID::XMLDSig::Document.new(decoded_string)
          else
            raise error(decoded_string)
          end
        elsif string.start_with? '<?xml'
          @doc = NemID::XMLDSig::Document.new(string)
        else
          raise NemID::Errors::ResponseError
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

      def valid_certificate_chain?
        @doc.validate_certificate_chain
      end

      def validate_response
        raise NemID::Errors::InvalidSignature if not valid_signature?
        raise NemID::Errors::InvalidCertificateChain if not valid_certificate_chain?
        raise NemID::Errors::UserCertificateExpired if user_certificate_expired?
        raise NemID::Errors::UserCertificateRevoked if user_certificate_revoked?

        true
      end
      
      def valid_signature?
        @doc.validate_signature
      end

      private
      def class_exists?(class_name)
        klass = Module.const_get(class_name)
        return klass.is_a?(Class)
      rescue NameError
        return false
      end

      def error(str)
        klass = "NemID::Errors::#{str}Error"
        if class_exists?(klass)
          return eval(klass) 
        else
          return NemID::Errors::ResponseError
        end
      end

      def serial_number
        @serial_number ||= @doc.extract_pid_or_rid
      end
    end
  end
end