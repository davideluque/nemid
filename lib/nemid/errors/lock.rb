module NemID
  module Errors
    class LOCKError < ResponseError
      DA_SUPPORT_URL = '[https://www.nemid.nu/dk-da/support/faa_hjaelp_til_nemid/kontakt/]'
      EN_SUPPORT_URL = '[https://www.nemid.nu/dk-en/support/contact/]'

      def initialize(msg='')
        super(msg)
      end
    end

    class LOCK001Error < LOCKError
      def initialize
        @da = "Du har angivet forkert bruger-id eller adgangskode for mange gange. " \
        "NemID er nu spærret i 8 timer, hvorefter du kan forsøge igen Har du " \
        "glemt din adgangskode kan du finde hjælp her #{DA_SUPPORT_URL}. " 
        @en = "You have used the wrong user ID or password too many times. " \
        "Your NemID is now blocked for 8 hours after which you can try again. " \
        "If you have forgotten your password you can find support here " \
        "#{EN_SUPPORT_URL}"
        super
      end
    end

    class LOCK002Error < LOCKError
      def initialize
        @da = "Du har angivet en forkert adgangskode for mange gange. " \
        "Dit NemID er spærret. Kontakt NemID support for at få adgang til dit " \
        "NemID igen. #{DA_SUPPORT_URL}"
        @en = "You have used a wrong password too many times. Your NemID is " \
        "blocked and cannot be used. To get help with this problem, Please contact " \
        "NemID support. #{EN_SUPPORT_URL}"
        super
      end
    end

    class LOCK003Error < LOCKError
      def initialize
        @da = "Du har angivet forkert NemID nøgle for mange gange. " \
        "Dit NemID er spærret. Kontakt NemID support for at få adgang til dit " \
        "NemID igen.#{DA_SUPPORT_URL}"
        @en = "You have entered a wrong NemID key too many times. Your NemID is " \
        "blocked and cannot be used.  Please contact NemID support. #{EN_SUPPORT_URL}"
        super
      end
    end
  end
end
