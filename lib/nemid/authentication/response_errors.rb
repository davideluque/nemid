module NemID
  module Authentication
    class APP001Error < StandardError
      attr_reader :da, :en

      def initialize(
          msg="Fix the integration issue. [JS Client: See tool at" \
          "/developers/validateparameters.jsp]", 
          sp='support'
        )

        @da = "Der er opstået en teknisk fejl. Forsøg igen. Kontakt #{sp}, hvis " \
        "problemet fortsætter."
        @en = "A technical error has occurred. Please try again. Contact #{sp} if " \
        "the problem persists"
        
        super(msg)
      end
    end
    
    def error_codes
      {
        "APP001"=>"QVBQMDAx",
        "APP002"=>"QVBQMDAy",
        "APP003"=>"QVBQMDAz",
        "APP004"=>"QVBQMDA0",
        "APP007"=>"QVBQMDA3",
        "APP008"=>"QVBQMDA4",
        "APP009"=>"QVBQMDA5",
        "APP010"=>"QVBQMDEw",
        "AUTH001"=>"QVVUSDAwMQ==",
        "AUTH002"=>"QVVUSDAwMg==",
        "AUTH003"=>"QVVUSDAwMw==",
        "AUTH004"=>"QVVUSDAwNA==",
        "AUTH005"=>"QVVUSDAwNQ==",
        "AUTH006"=>"QVVUSDAwNg==",
        "AUTH007"=>"QVVUSDAwNw==",
        "AUTH008"=>"QVVUSDAwOA==",
        "AUTH009"=>"QVVUSDAwOQ==",
        "AUTH010"=>"QVVUSDAxMA==",
        "AUTH011"=>"QVVUSDAxMQ==",
        "AUTH012"=>"QVVUSDAxMg==",
        "AUTH013"=>"QVVUSDAxMw==",
        "AUTH017"=>"QVVUSDAxNw==",
        "AUTH018"=>"QVVUSDAxOA==",
        "AUTH019"=>"QVVUSDAxOQ==",
        "CAN001"=>"Q0FOMDAx",
        "CAN002"=>"Q0FOMDAy",
        "CAN003"=>"Q0FOMDAz",
        "CAN004"=>"Q0FOMDA0",
        "CAN005"=>"Q0FOMDA1",
        "CAN006"=>"Q0FOMDA2",
        "CAN007"=>"Q0FOMDA3",
        "CAN008"=>"Q0FOMDA4",
        "CAPP001"=>"Q0FQUDAwMQ==",
        "CAPP002"=>"Q0FQUDAwMg==",
        "CAPP003"=>"Q0FQUDAwMw==",
        "CAPP004"=>"Q0FQUDAwNA==",
        "CAPP006"=>"Q0FQUDAwNg==",
        "CAPP007"=>"Q0FQUDAwNw==",
        "CAPP008"=>"Q0FQUDAwOA==",
        "CAPP009"=>"Q0FQUDAwOQ==",
        "CAPP010"=>"Q0FQUDAxMA==",
        "CAPP011"=>"Q0FQUDAxMQ==",
        "CAPP012"=>"Q0FQUDAxMg==",
        "CAPP013"=>"Q0FQUDAxMw==",
        "LIB002"=>"TElCMDAy",
        "LOCK001"=>"TE9DSzAwMQ==",
        "LOCK002"=>"TE9DSzAwMg==",
        "LOCK003"=>"TE9DSzAwMw==",
        "SRV001"=>"U1JWMDAx",
        "SRV002"=>"U1JWMDAy",
        "SRV003"=>"U1JWMDAz",
        "SRV004"=>"U1JWMDA0",
        "SRV005"=>"U1JWMDA1",
        "SRV006"=>"U1JWMDA2",
        "SRV007"=>"U1JWMDA3",
        "SRV008"=>"U1JWMDA4",
        "SRV010"=>"U1JWMDEw",
        "SRV011"=>"U1JWMDEx",
        "OCES001"=>"T0NFUzAwMQ==",
        "OCES002"=>"T0NFUzAwMg==",
        "OCES003"=>"T0NFUzAwMw==",
        "OCES004"=>"T0NFUzAwNA==",
        "OCES005"=>"T0NFUzAwNQ==",
        "OCES006"=>"T0NFUzAwNg=="
      }
    end
  end
end