module NemID
  module Errors
    class OCESError < ResponseError
      def initialize(msg='')
        super(msg)
      end
    end

    class OCES001Error < OCESError
      def initialize
        @da = "Du har kun NemID til netbank. Ønsker du at bruge NemID til andre " \
        "hjemmesider, skal du tilknytte en offentlig digital signatur til dit NemID. " \
        "[https://service.nemid.nu/dk-da/bestil_nemid/bestil_offentlig_digital_signatur_til_dit_nemid/]."
        @en = "You only have NemID for online banking. If you wish to use NemID for " \
        "other public or private services, you must affiliate a public digital " \
        "signature to your NemID " \
        "[https://service.nemid.nu/dk-da/bestil_nemid/bestil_offentlig_digital_signatur_til_dit_nemid/]"
        super
      end
    end
    
    class OCES002Error < OCESError
      def initialize
        @da = "Ønsker du at bruge NemID til andet end netbank, skal du først " \
        "tilknytte en offentlig digital signatur. Det kan du gøre ved at lave en " \
        "almindelig NemID bestilling. " \
        "Bestil NemID [https://service.nemid.nu/dk-da/bestil_nemid/]."
        @en = "If you wish to use NemID for other services than online banking, " \
        "you have to affiliate a public digital signature to your NemID. " \
        "You can do this by starting the regular NemID order flow, which will " \
        "then order the needed public digital signature. " \
        "Request NemID [https://service.nemid.nu/dk-da/bestil_nemid/]"
        super
      end
    end
    
    class OCES003Error < OCESError
      def initialize
        @da = "Der er ikke tilknyttet en offentlig digital signatur til " \
        "det NemID du har forsøgt at logge på med. Hvis du tidligere har logget " \
        "ind hos os med NemID, kan fejlen skyldes, at du har flere NemID, og har " \
        "brugt et andet end normalt."
        @en = "You have attempted to log on using a NemID with no public " \
        "digital signature. If you previously have logged on to our service " \
        "using your NemID, the error can be due to having more than one NemID and " \
        "having used a different NemID than normally."
        super
      end
    end

    class OCES004Error < OCESError
      def initialize
        @da = "Du kan kun bruge dette NemID til netbank."
        @en = "You can only use this NemID for your online banking service."
        super
      end
    end

    class OCES005Error < OCESError
      def initialize(msg="The service provider is advised to perform a reload of " \
        "the client so the user can try again. Also, if the problem persists, refer to Support.")
        @da = "Udstedelsen af din offentlige digitale signatur mislykkedes. "  \
        "Forsøg venligst igen. Hvis problemet fortsætter, kontakt NemID support " \
        "[https://www.nemid.nu/dk-da/support/faa_hjaelp_til_nemid/kontakt/]"
        @en = "Issuing your public digital signature failed. Please try again. " \
        "If the problem persists contact NemID support " \
        "[https://www.nemid.nu/dk-en/support/contact/]"
        super
      end
    end

    class OCES006Error < OCESError
      def initialize
        @da = "Du har ikke en aktiv offentlig digital signatur tilknyttet " \
        "NemID i øjeblikket. Ved bestilling af NemID vil du blive tilbudt at knytte " \
        "en signatur til dit nuværende NemID. Bestil NemID [https://service.nemid.nu/dk-da/bestil_nemid/]."
        @en = "You currently don’t have an active public digital signature " \
        "(OCES certificate) affiliated with your NemID. To get this, start the regular " \
        "NemID order flow after which you will be asked to affiliate a public " \
        "digital signature with your current NemID. Request NemID [https://service.nemid.nu/dk-da/bestil_nemid/]"
        super  
      end
    end
  end
end