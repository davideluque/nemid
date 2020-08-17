module NemID
  module Authentication
    class Response
      
      def initialize(string)
        if string.start_with? '<?xml'
          NemID::XMLDSig::Document.new(string)
        elsif string.match?(/\A[A-Za-z0-9+\/\r\n]+={0,2}\z/)
          NemID::XMLDSig::Document.new(Base64.decode64(string))
        else
          raise NemID::Authentication::ResponseError
        end
      end

    end
  end
end