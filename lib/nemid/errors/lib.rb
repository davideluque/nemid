module NemID
  module Errors
    class LIBError
      def initialize(msg='')
        super(msg)
      end
    end

    class LIB002Error
      def initialize(sp='support')
        @da = "Der er opstået en teknisk fejl på grund af netværksproblemer. Forsøg igen. " \
        "Kontakt #{sp}, hvis problemet fortsætter."
        @en = "A technical error has occurred due to network issues. Please try again. " \
        "Contact #{sp} if the problem persists"
        super
      end
    end
  end
end
