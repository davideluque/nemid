module NemID
  class Login

    def client_initialization_parameters
      params = unsigned_params
      normalized_unsigned_params = normalize(unsigned_params)
      
      params.merge({
        "Digest_signature": digest_signature(normalized_unsigned_params),
        "Params_Digest": params_digest(normalized_unsigned_params),
      })
    end

    private
    def digest_signature(normalized_unsigned_params)
      #NemID::Crypto.base64_encoded_rsa_signature
    end

    def normalize(params)
      params = params.transform_keys(&:downcase)
      
      str = ''
      
      params.keys.sort.each { |k| str += "#{k.to_s}#{params[k]}" }

      return str
    end

    def params_digest(normalized_unsigned_params)
      #NemID::Crypto.calculate_digest(normalized_params)
    end

    def sp_cert
      #NemID::Crypto.base64_encoded_der_representation
    end

    def unsigned_params
      {
        "TimeStamp": Time.now.utc.to_s,
        "ClientFlow": "OCESLOGIN2",
        "Signtext_Format": "html",
        "SP_cert": sp_cert,
      }
    end
  end
end
