module NemID
  module Errors
    class APPError < ResponseError
      def initialize(msg='', sp='support')
        @da = "Der er opstået en teknisk fejl. Forsøg igen. Kontakt #{sp}, hvis " \
        "problemet fortsætter."
        @en = "A technical error has occurred. Please try again. Contact #{sp} if " \
        "the problem persists"
        super(msg)
      end
    end
    
    class APP001Error < APPError
      def initialize(msg="Fix the integration issue. [JS Client: See tool at" \
        "/developers/validateparameters.jsp]")
        super
      end
    end

    class APP002Error < APPError
      def initialize(msg="Correct the sign text. [JS Client: See tool at " \
        "/developers/signtextviewer.jsp]")
        super
      end
    end

    class APP003Error < APPError; end 

    class APP004Error < APPError; end

    class APP007Error < APPError
      def initialize(msg="Fix the integration issue. [JS Client: See tool at" \
        "/developers/validateparameters.jsp]")
        super
      end
    end      

    class APP008Error < APPError
      def initialize(msg="Fix the integration issue. [JS Client: See tool at" \
        "/developers/validateparameters.jsp]")
        super
      end
    end

    class APP009Error < APPError; end

    class APP010Error < APPError; end
  end
end
