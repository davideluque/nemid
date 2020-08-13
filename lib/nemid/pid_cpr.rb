require 'savon'

module NemID
    class PidCpr

        def initialize(spid, pid, ssl_cert, ssl_cert_key)
             @spid = spid
             @pid = pid
             @ssl_cert_file = ssl_cert
             @ssl_cert_key_file = ssl_cert_key
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
                result[:cpr]
            else
                logger.warn "PID match failed with status code #{result[:status_code]}"
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
                :ssl_cert_file => @ssl_cert_file,
                :ssl_cert_key_file => @ssl_cert_key_file,
                :headers => { 'SOAPAction' => ''}
              }
            client = Savon.client(options)
            client
        end

        def logger
            Rails.logger
        end
    end 
end