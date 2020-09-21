module NemID
  module Errors
    class CAPPError < ResponseError
      def initialize(msg='')
        super(msg)
      end
    end

    class CAPP001Error < CAPPError 
      def initialize
        @en = "The code app could not be enrolled due to violation of the app's restricted identity type."
        @da = "Nøgleappen kunne ikke blive indskrevet på grund af krænkelse af app'ens begrænsede identites type."
        super
      end
    end

    class CAPP002Error < CAPPError
      def initialize
        @en = "Your code app could not be enrolled due to violation of the suspension rules."
        @da = "Din nøgleapp kunne ikke blive indskrevet på grund af krænkelse af suspensionsreglerne."
        super
      end
    end
    
    class CAPP003Error < CAPPError
      def initialize
        @en = "Your code app could not be enrolled due to its app id is not in status active."
        @da = "Din nøgleapp kunne ikke blive indskrevet på grund af, at dens app id ikke er i en aktiv status."
        super
      end
    end
    
    class CAPP004Error < CAPPError
      def initialize
        @en = "Your code app is suspended or revoked. Please try and update your code app."
        @da = "Din nøgleapp er suspenderet eller spærret. Prøv at opdatere din nøgleapp."
        super
      end
    end
    
    class CAPP006Error < CAPPError
      def initialize
        @en = "Your code app could not be activated as it could not be found for the user who logged in."
        @da = "Din nøgleapp kunne ikke blive aktiveret, da den ikke kunne blive fundet for brugeren der loggede ind."
        super
      end
    end
    
    class CAPP007Error < CAPPError
      def initialize
        @en = "Your code app could not be activated as it did not have the correct status (VALIDATION_MISSING)."
        @da = "Din nøgleapp kunne ikke blive aktiveret, da den ikke har den korrekte status (VALIDATIONS_MISSING)."
        super
      end
    end
    
    class CAPP008Error < CAPPError
      def initialize
        @en = "Your code app could not be activated as the waiting period has not expired."
        @da = "Din nøgleapp kunne ikke blive aktiveret, da venteperioden ikke er uløbet."
        super
      end
    end
    
    class CAPP009Error < CAPPError
      def initialize
        @en = "Your code app could not be activated as the waiting period has not expired."
        @da = "Din nøgleapp kunne ikke blive aktiveret, da venteperioden ikke er uløbet."
        super
      end
    end
    
    class CAPP010Error < CAPPError
      def initialize
        @en = "The reset of your code app pin could not be done as the code app is not in status active."
        @da = "Nulstilling af din nøgeleapps pin kunne ikke blive fuldført, da din nøgleapp ikke er i en aktiv status."
        super
      end
    end
    
    class CAPP011Error < CAPPError
      def initialize
        @en = "The validation of the admin action challenge failed."
        @da = "Valideringen af admin action challenge fejlede."
        super
      end
    end
    
    class CAPP012Error < CAPPError
      def initialize
        @en = "Your code app could not be enrolled as the code app id does not exist."
        @da = "Din nøgleapp kunne ikke blive indskrefvet, da dens app id ikke eksisterer."
        super
      end
    end
    
    class CAPP013Error < CAPPError
      def initialize
        @en = "Your code app could not be enrolled due to incorrect software fingerprint or missing whitelist of software fingerprint"
        @da = "Din nøgleapp kunne ikke blive indskrevet på grund af forkert software fingeraftryk eller manglende whitelist af software fingeraftryk."
        super
      end
    end
  end
end