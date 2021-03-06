require 'savon'

module NemID
  class PIDCPR

    def initialize(cert:, key:, spid:)
      @crypto = NemID::Crypto.new(cert: cert, key: key)
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
    def match pid:, cpr:
      response = soap_client.call(:pid,
        message: build_soap_message(pid: pid, cpr: cpr)
      )
    
      response.to_hash[:pid_response][:result][:pid_reply]
    end

    private
    def build_soap_message pid:, cpr:
      {
        :pIDRequests => {
          :PIDRequest => {
            PID: pid,
            CPR: cpr,
            serviceId: @spid,
          }
        }
      }
    end

    def pid_service_url
      case NemID.configuration.env
      when 'production', 'staging'
        'https://pidws.certifikat.dk/pid_serviceprovider_server/pidws/'
      else
        'https://pidws.pp.certifikat.dk/pid_serviceprovider_server/pidws'
      end
    end

    def soap_client
      options = {
        :wsdl => "#{pid_service_url}?WSDL",
        :soap_version => 1,
        :endpoint => pid_service_url,
        :convert_request_keys_to => :none,
        :ssl_cert => @crypto.get_certificate,
        :ssl_cert_key => @crypto.get_key,
        :headers => { 'SOAPAction' => ''}
      }
      return Savon.client(options)
    end
  end 
end
