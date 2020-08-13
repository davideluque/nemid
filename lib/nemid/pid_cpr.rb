require 'savon'

module NemID
    class PidCpr

        def initialize(spid, pid, ssl_cert, ssl_cert_key)
             @spid = spid
             @pid = pid
             @ssl_cert_file = ssl_cert
             @ssl_cert_key_file = ssl_cert_key
        end

    end 
end