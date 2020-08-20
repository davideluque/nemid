module NemID
  module Errors
    class CAPPError < ResponseError
      def initialize(msg='')
        super(msg)
      end
    end

    class CAPP001Error < CAPPError; end

    class CAPP002Error < CAPPError; end
    
    class CAPP003Error < CAPPError; end
    
    class CAPP004Error < CAPPError
      def initialize
        @da = "Your code app is suspended or revoked. Please try and update your code app."
        @en = "Din nøgleapp er suspenderet eller spærret. Prøv at opdatere din nøgleapp."
        super
      end
    end
    
    class CAPP006Error < CAPPError; end
    
    class CAPP007Error < CAPPError; end
    
    class CAPP008Error < CAPPError; end
    
    class CAPP009Error < CAPPError; end
    
    class CAPP010Error < CAPPError; end
    
    class CAPP011Error < CAPPError; end
    
    class CAPP012Error < CAPPError; end
    
    class CAPP013Error < CAPPError; end
  end
end