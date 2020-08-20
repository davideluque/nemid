module NemID
  module Errors
    class AUTHError < ResponseError
      def initialize(msg="The service provider is recommended to refer the user " \
        "to NemID support.")
        super(msg)
      end
    end
    
    class AUTH001Error < AUTHError
      def initialize
        @da = "Dit NemID er spærret. Kontakt NemID support " \
        "[https://www.nemid.nu/dk-da/support/faa_hjaelp_til_nemid/kontakt/]."
        @en = "Your NemID is blocked. Please contact NemID support. " \
        "[https://www.nemid.nu/dk-en/support/contact/]"
        super
      end
    end

    class AUTH003Error < AUTHError
      def initialize(msg='')
        @da = "Login er gennemført korrekt, men du har ikke en bankaftale. " \
        "Kontakt din bank for at høre nærmere."
        @en = "Login succeeded but you have no bank agreement. Please contact " \
        "your bank for more details"
        super
      end
    end

    class AUTH004Error < AUTHError
      def initialize
        @da = "Dit NemID er midlertidigt låst i 8 timer og du kan ikke logge på " \
        "før spærringen er ophævet"
        @en = "Your NemID is temporarily locked and you cannot log on until the " \
        "8 hour time lock has been lifted."
        super
      end
    end

    class AUTH005Error < AUTHError
      def initialize
        @da = "Dit NemID er spærret. Kontakt NemID support " \
        "[https://www.nemid.nu/dk-da/support/faa_hjaelp_til_nemid/kontakt/]."
        @en = "Your NemID has been blocked. Please contact NemID support. " \
        "[https://www.nemid.nu/dk-en/support/contact/]"
        super
      end
    end
    
    class AUTH006Error < AUTHError
      def initialize
        @da =  "Du har brugt alle nøgler på nøglekortet. " \
        "Du kan bestille et nyt på siden Mistet nøglekort. " \
        "[https://service.nemid.nu/dk-da/nemid/noeglekort/mistet_noeglekort/]"
        @en = "You have used all the codes on your code card. " \
        "You can order a new code card on the Lost code card page. " \
        "[https://service.nemid.nu/dk-en/nemid/code_cards/lost_code_card/]"
        super
      end
    end      

    class AUTH007Error < AUTHError
      def initialize
        @da = "Din NemID-adgangskode er spærret på grund af for mange fejlede forsøg. " \
        "Kontakt NemID support [https://www.nemid.nu/dk-da/support/faa_hjaelp_til_nemid/kontakt/]."
        @en = "Your NemID password is blocked due to too many failed password attempts. " \
        "Please contact NemID support. [https://www.nemid.nu/dk-en/support/contact/]"
        super
      end
    end

    class AUTH008Error < AUTHError
      def initialize
        @da = "Dit NemID er ikke aktivt og du skal bestille en ny midlertidig " \
        "adgangskode til aktivering hos support. Ring til NemID support " \
        "[https://www.nemid.nu/dk-da/support/faa_hjaelp_til_nemid/kontakt/]."
        @en = "Your NemID is not active and you need support to issue a new " \
        "activation password to activate. Please call NemID support. " \
        "[https://www.nemid.nu/dk-en/support/contact/]"
        super
      end
    end

    class AUTH009Error < AUTHError
      def initialize(msg="The service provider is advised to perform a reload of " \
        "the client so the user can re-authenticate and try again. Also, if the " \
        "problem persists, refer to Support")
        @da = "Der er opstået en teknisk fejl. Forsøg igen."
        @en = "A technical error has occurred. Please try again."
        super(msg)
      end
    end

    class AUTH010Error < AUTHError
      def initialize(msg="The service provider is advised to perform a reload of " \
        "the client so the user can re-authenticate and try again.")
        @da = "Der er opstået en teknisk fejl. Tjek at kun ét NemID login er " \
        "aktivt og forsøg igen."
        @en = "A technical error has occurred. Please try again, and ensure that " \
        "only one NemID login is running."
        super(msg)
      end
    end

    class AUTH011Error < AUTHError
      def initialize(msg='')
        @da = "NemID på mobil understøtter ikke brug af midlertidig adgangskode. " \
        "Kontakt NemID support for atfå en ny kode udstedt. " \
        "[https://www.nemid.nu/dk-da/support/faa_hjaelp_til_nemid/kontakt/]" \
        "Prøv derefter igen."
        @en = "NemID login on mobile does not support authentication using a " \
        "temporary password. Please contact NemID support to have a new temporary " \
        "password issued. [https://www.nemid.nu/dk-en/support/contact/] " \
        "Thereafter, please try again."
        super
      end
    end

    class AUTH012Error < AUTHError
      def initialize(msg="The service provider is advised to perform a reload of " \
        "the client so the user can re-authenticate and try again")
        @da = "Der er opstået en teknisk fejl. Forsøg igen."
        @en = "A technical error has occurred. Please try again."
        super
      end
    end

    class AUTH013Error < AUTHError
      def initialize(msg="The service provider is advised to perform a reload of " \
        "the client so the user can re-authenticate using regular 2-factor authentication.")
        @da = "Der er opstået en teknisk fejl. Forsøg igen."
        @en = "A technical error has occurred. Please try again."
        super
      end
    end

    class AUTH017Error < AUTHError
      def initialize(msg="Consider displaying information suggesting how to avoid " \
        "known environmental problems.")
        @da = "En teknisk fejl i browseren gør at NemID ikke kan starte. Forsøg " \
        "at slå unødige plug-ins fra, eller prøv igen med en anden browser."
        @en = "Something in the browser environment has caused NemID to stop " \
        "working. This could be because of an incompatible plug-in, too " \
        "restrictive privacy settings or other environment factors. " \
        "Please try deactivating plugins, resetting your browser settings " \
        "or try using a different browser."
        super
      end
    end

    class AUTH018Error < AUTHError
      def initialize(msg='')
        @da = "Din nøgleapp er spærret. For at bruge den igen skal den genaktiveres."
        @en = "Your code app is revoked. To use it again please reactivate it."
        super
      end
    end
  end
end
