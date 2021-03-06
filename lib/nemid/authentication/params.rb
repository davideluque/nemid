require 'date'

module NemID
  module Authentication
    class Params
      def initialize(cert:, key:)
        @nemid_crypto = NemID::Crypto.new(cert: cert, key: key)
      end
  
      def client_initialization_parameters
        params = unsigned_params
        normalized_unsigned_params = normalize(unsigned_params)
        
        params.merge({
          "DIGEST_SIGNATURE": digest_signature(normalized_unsigned_params),
          "PARAMS_DIGEST": params_digest(normalized_unsigned_params),
        })
      end
  
      private
      def digest_signature(normalized_unsigned_params)
        @nemid_crypto.base64_encoded_rsa_signature(normalized_unsigned_params)
      end
  
      def normalize(params)
        params = params.transform_keys(&:upcase)
        
        str = String.new
        
        params.keys.sort.each { |k| str += "#{k.to_s}#{params[k]}" }
  
        return str
      end
  
      def params_digest(normalized_unsigned_params)
        @nemid_crypto.base64_encoded_digest_representation(normalized_unsigned_params)
      end
  
      def sp_cert
        @nemid_crypto.base64_encoded_der_representation
      end
  
      def unsigned_params
        {
          "CLIENTFLOW": "OCESLOGIN2",
          "ENABLE_AWAITING_APP_APPROVAL_EVENT": "TRUE",
          "SP_CERT": sp_cert,
          "TIMESTAMP": DateTime.now.new_offset(0).strftime('%F %T%z'),
        }
      end
    end
  end
end