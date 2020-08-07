module NemID
  class Login
    
    def client_initialization_parameters
      {
        "TimeStamp": Time.now.utc.to_s,
        "ClientFlow": "OCESLOGIN2",
        "Signtext_Format": "html",
        "Params_Digest": params_digest,
        "Digest_signature": digest_signature,
        "SP_cert": sp_cert,
        "Signtext": signtext
      }
    end

    private
    def digest_signature
    end

    def params_digest
    end

    def signtext
    end

    def sp_cert
    end
  end
end
