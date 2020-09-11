module NemID
  module Errors
    class LIBError < ResponseError
      def initialize(msg='')
        super(msg)
      end
    end

    class LIB002Error < LIBError
      def initialize
        @da = "Der er opstået en teknisk fejl på grund af netværksproblemer. Forsøg igen. " \
        "Kontakt support, hvis problemet fortsætter."
        @en = "A technical error has occurred due to network issues. Please try again. " \
        "Contact support if the problem persists"
        super
      end
    end
  end
end
