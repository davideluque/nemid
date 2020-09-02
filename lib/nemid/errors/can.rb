module NemID
  module Errors
    class CANError < ResponseError
      def initialize(msg='') 
        super(msg)
      end
    end

    class CAN001Error < CANError
      def initialize(msg="Redirect the user to a sensible place, taking into " \
        "account where the user is in the flow.")
        @da = "Du har afbrudt aktiveringen efter du har brugt den midlertidige adgangskode. " \
        "Din midlertidige adgangskode er ikke længere gyldig, og du skal bestille " \
        "en ny midlertidig adgangskode, før du kan aktivere og bruge NemID. " \
        "Den nye, midlertidige adgangskode kan du bestille via NemID-support " \
        "[https://www.nemid.nu/dk-da/support/faa_hjaelp_til_nemid/kontakt/]."
        @en = "You have cancelled the activation of NemID after submitting the activation password. " \
        "Your activation password is no longer valid, and you must request a new " \
        "activation password before you can activate and use NemID. " \
        "You can order your new activation password via NemID Support " \
        "[https://www.nemid.nu/dk-en/support/contact/]"
        super
      end
    end

    class CAN002Error < CANError
      def initialize(msg="The service provider must send the user to a sensible " \
        "place, taking into account where the user is in the flow.")
        @da = "Du har afbrudt login."
        @en = "You have cancelled login."
        super
      end
    end

    class CAN003Error < CANError
      def initialize
        @da = "Forbindelsen til applikationen er timet ud eller er blevet " \
        "afbrudt af en anden app. Forsøg igen."
        @en = "The connection to the application has timed out or has been " \
        "interrupted by another app. Please try again."
        super
      end
    end

    class CAN004Error < CANError
      def initialize
        @da = "Sessionen er afbrudt. Forsøg igen."
        @en = "The session is cancelled. Please try again."
        super
      end
    end

    class CAN005Error < CANError
      def initialize
        @da = "Det tog for lang tid, før du godkendte den anmodning, du havde " \
        "sendt til din nøgleapp"
        @en = "You took too long to authenticate the request you had sent to " \
        "your code app."
        super
      end
    end

    class CAN006Error < CANError
      def initialize
        @da = "Du kan højst have ##MAXACTIVENMAS## aktive nøgleapps ad gangen. " \
        "Hvis du vil aktivere en ny nøgleapp, skal du først spærre en af dine " \
        "nuværende på nemid.nu eller ved at kontakte NemID support eller din bank"
        @en = "The maximum number of active code apps you can have at any time " \
        "is ##MAXACTIVENMAS##. If you wish to activate another code app, you must " \
        "first block one of your current code apps at nemid.nu or by contacting NemID " \
        "Support or your bank."
        super
      end
    end

    class CAN007Error < CANError
      def initialize
        @da = "Du har afvist din anmodning om godkendelse i din nøgleapp. Hvis " \
        "det var en fejl, kan du sende en ny anmodning, når du har afsluttet ved " \
        "at klikke på \"Ok\"."
        @en = "You rejected your code app authentication request. If this was " \
        "incorrect, you can submit a new request after clicking \"OK\" to finish."
        super
      end
    end

    class CAN008Error < CANError
      def initialize(msg="User should be notified and could have a choice to restart transaction")
        @da = "Du har sendt en ny anmodning til godkendelse i din nøgleapp, som " \
        "overskriver en eksisterende."
        @en = "You sent a new authentication request to your code app overwriting " \
        "an existing one."
        super
      end
    end
  end
end