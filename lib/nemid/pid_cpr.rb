require 'savon'

module NemID
    class PidCpr

        def initialize(spid, pid, cert, key)
            @spid = spid
            @pid = pid
            @cert = cert
            @key = key
        end

        def pid_cpr_match
            @cpr ||= nil
            @soap_client = soap_client

            response = @soap_client.call(:pid,
                message: {
                    :pIDRequests => {
                        :PIDRequest => {
                            PID: @pid,
                            CPR: @cpr,
                            serviceId: @spid,
                        }
                    }
                }
            )  

            result = response.to_hash[:pid_response][:result][:pid_reply]
            
            if result[:status_code] == "0"
                result
            else
                "PID match failed with status code #{result[:status_code]}"
            end
        end

        private
        def soap_client
            pid_service_url = "https://pidws.pp.certifikat.dk/pid_serviceprovider_server/pidws"
            options = {
                :wsdl => "#{pid_service_url}?WSDL",
                :soap_version => 1,
                :endpoint => pid_service_url,
                :convert_request_keys_to => :none,
                :ssl_cert_file => @cert,
                :ssl_cert_key_file => @key,
                :headers => { 'SOAPAction' => ''}
            }
            client = Savon.client(options)
            client
        end
    end 
end