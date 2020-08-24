require 'savon'

module NemID
    class PIDCPR
        PID_SERVICE_URL = "https://pidws.pp.certifikat.dk/pid_serviceprovider_server/pidws"

        def initialize(spid, cert, pass)
          @crypto = NemID::Crypto.new(cert, pass)
          @spid = spid
        end

=begin
    STATUS CODE RESPONSES:
    O = OK (”OK", "OK") 
    1 = NO_MATCH ("CPR svarer ikke til PID", "CPR does not match PID")
    2 = NO_PID ("PID eksisterer ikke", "PID doesn't exist") 
    4 = NO_PID_IN_CERTIFICATE ("PID kunne ikke findes i certifikatet", "No PID in certificate") 
    8 = NOT_AUTHORIZED_FOR_CPR_LOOKUP ("Der er ikke rettighed til at foretage CPR opslag", "Caller not authorized for CPR lookup") 
    16 = BRUTE_FORCE_ATTEMPT_DETECTED ("Forsøg på systematisk søgning på CPR", "Brute force attempt detected") 
    17 = NOT_AUTHORIZED_FOR_SERVICE_LOOKUP ( "Der er ikke rettighed til at foretage opslag på service", "Caller not authorized for service lookup") 
    4096 = NOT_PID_SERVICE_REQUEST ("Modtaget message ikke pidCprRequest eller pidCprServerStatus", "Non request XML received") 
    8192 = XML_PARSE_ERROR ("XML pakke kan ikke parses", "Non parsable XML received") 
    8193 = XML_VERSION_NOT_SUPPORTED ("Version er ikke understøttet", "Version not supported") 
    8194 = PID_DOES_NOT_MATCH_BASE64_CERTIFICATE ("PID stemmer med ikke med certifikat", "PID does not match certifikat") 
    8195 = MISSING_CLIENT_CERT ("Klient certifikat ikke præsenteret", "No client certificate presented") 
    16384 = INTERNAL_ERROR ("Intern DanID fejl", "Internal DanID error")
=end
        def match(pid, cpr)
            cpr ||= nil
            @soap_client = soap_client

            begin
              response = @soap_client.call(:pid,
                message: {
                  :pIDRequests => {
                    :PIDRequest => {
                      PID: pid,
                      CPR: cpr,
                      serviceId: @spid,
                    }
                  }
                }
              )
            rescue Savon::HTTPError => e
              delete_cert_files
              return e
            end
          
            result = response.to_hash[:pid_response][:result][:pid_reply]
            
            if result[:status_code] == "0"
              result
            else
              result
              #"PID match failed with status code #{result[:status_code]} - #{result[:status_text_uk]}"
            end
            delete_cert_files
        end

        private
        def soap_client
            create_cert_files
            options = {
              :wsdl => "#{PID_SERVICE_URL}?WSDL",
              :soap_version => 1,
              :endpoint => PID_SERVICE_URL,
              :convert_request_keys_to => :none,
              :ssl_cert_file => "cert-file.pem",
              :ssl_cert_key_file => "key-file.pem",
              :headers => { 'SOAPAction' => ''}
            }
            return Savon.client(options)
        end

        def create_cert_files 
          open("cert-file.pem", "w") do |io| io.write(@crypto.pkcs12.certificate.to_pem) end
          open("key-file.pem", "w") do |io| io.write(@crypto.pkcs12.key.private_to_pem) end
        end

        def delete_cert_files
          File.delete("cert-file.pem") if File.exists?("cert-file.pem")
          File.delete("key-file.pem") if File.exists?("key-file.pem")
        end
    end 
end
