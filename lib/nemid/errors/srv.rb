module NemID
  module Errors
    class SRVError < ResponseError
      def initialize(msg='')
        @da = "Der er opstået en teknisk fejl. Forsøg igen. " \
        "Kontakt support, hvis problemet fortsætter."
        @en = "A technical error has occurred. Please try again. " \
        "Contact support if the problem persists. "
        super(msg)
      end
    end

    class SRV001Error < SRVError; end

    class SRV002Error < SRVError; end

    class SRV003Error < SRVError; end

    class SRV004Error < SRVError
      def initialize
        super
        @da = "Der er opstået en teknisk fejl. Kontakt NemID support " \
        "[https://www.nemid.nu/dk-da/support/faa_hjaelp_til_nemid/kontakt/]."
        @en = "A technical error has occurred. Please contact NemID support. " \
        "[https://www.nemid.nu/dk-en/support/contact/]"
      end
    end

    class SRV005Error < SRVError; end

    class SRV006Error < SRVError
      def initialize
        super
        @da = "Tidsgrænse er overskredet. Forsøg venligst igen."
        @en = "Time limit exceeded. Please try again."
      end
    end

    class SRV007Error < SRVError
      def initialize
        super
        @da = "Opdater venligst til nyeste version af appen."
        @en = "Please update to the most recent version of the app."
      end
    end

    class SRV008Error < SRVError
      def initialize(msg='Fix the integration issue.')
        super
        @da = "Der er opstået en teknisk fejl. Kontakt support."
        @en = "A technical error has occurred. Contact support."
      end
    end

    class SRV010Error < SRVError
      def initialize(msg="There could be a problem with the enrollment of the " \
        "Service Provider’s VOCES certificate or its validity. Contact NemID for support.")
        super
      end
    end

    class SRV011Error < SRVError
      def initialize(msg="Fix the integration issue. The value specified in the " \
        "TRANSACTION_CONTEXT parameter to the JS Client was longer than the " \
        "allowed 100 characters.")
        super
        @da = "Der er opstået en teknisk fejl. Kontakt support."
        @en = "A technical error has occurred. Contact support."
      end
    end
  end
end