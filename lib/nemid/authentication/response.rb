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
            # if hash is like {"APP001": APP001Error (ErrorClass)} (KEY,CLASS) then:
            #raise ResponseError(ERROR_SET[decoded_string])
            # ^ sounds like too heavy for memory
            
            # if hash is {"APP001": BASE64_OF_APP001} then:
            #err_class = eval("#{decoded_string}Error") if ERROR_SET.key?(decoded_string)
            raise ResponseError#(err_class)
            
            # Also thought about using an arrray 
            # see https://stackoverflow.com/questions/32234733/javascript-what-lookup-is-faster-array-indexof-vs-object-hash
            # and https://stackoverflow.com/questions/5551168/performance-of-arrays-and-hashes-in-ruby
            # but then found... hybrid of Array's intuitive inter-operation facilities and Hash's fast lookup
            # -> https://ruby-doc.org/stdlib-2.7.1/libdoc/set/rdoc/Set.html
          end
        elsif string.start_with? '<?xml'
          @doc = NemID::XMLDSig::Document.new(string)
        else
          raise ResponseError
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

      private
      def serial_number
        @serial_number ||= @doc.extract_pid_or_rid
      end
    end
  end
end