module NemID
  module Errors
    class CAPPError < ResponseError
      def initialize(msg='')
        super(msg)
      end
    end

    class CAPP001Error < CAPPError 
      def initialize
        @da = "Nøgleappen kunne ikke blive indskrevet på grund af krænkelse af app'ens begrænsede identites type."
        @en = "The code app could not be enrolled due to violation of the app's restricted identity type."
        super
      end
    end

    class CAPP002Error < CAPPError
      def initialize
        @da = "Din nøgleapp kunne ikke blive indskrevet på grund af krænkelse af suspensionsreglerne."
        @en = "Your code app could not be enrolled due to violation of the suspension rules."
        super
      end
    end
    
    class CAPP003Error < CAPPError
      def initialize
        @da = "Din nøgleapp kunne ikke blive indskrevet på grund af, at dens app id ikke er i en aktiv status."
        @en = "Your code app could not be enrolled due to its app id is not in status active."
        super
      end
    end
    
    class CAPP004Error < CAPPError
      def initialize
        @da = "Din nøgleapp er suspenderet eller spærret. Prøv at opdatere din nøgleapp."
        @en = "Your code app is suspended or revoked. Please try and update your code app."
        super
      end
    end
    
    class CAPP006Error < CAPPError
      def initialize
        @da = "Din nøgleapp kunne ikke blive aktiveret, da den ikke kunne blive fundet for brugeren der loggede ind."
        @en = "Your code app could not be activated as it could not be found for the user who logged in."
        super
      end
    end
    
    class CAPP007Error < CAPPError
      def initialize
        @da = "Din nøgleapp kunne ikke blive aktiveret, da den ikke har den korrekte status (VALIDATIONS_MISSING)."
        @en = "Your code app could not be activated as it did not have the correct status (VALIDATION_MISSING)."
        super
      end
    end
    
    class CAPP008Error < CAPPError
      def initialize
        @da = "Din nøgleapp kunne ikke blive aktiveret, da venteperioden ikke er uløbet."
        @en = "Your code app could not be activated as the waiting period has not expired."
        super
      end
    end
    
    class CAPP009Error < CAPPError
      def initialize
        @da = "Din nøgleapp kunne ikke blive aktiveret, da venteperioden ikke er uløbet."
        @en = "Your code app could not be activated as the waiting period has not expired."
        super
      end
    end
    
    class CAPP010Error < CAPPError
      def initialize
        @da = "Nulstilling af din nøgeleapps pin kunne ikke blive fuldført, da din nøgleapp ikke er i en aktiv status."
        @en = "The reset of your code app pin could not be done as the code app is not in status active."
        super
      end
    end
    
    class CAPP011Error < CAPPError
      def initialize
        @da = "Valideringen af admin action challenge fejlede."
        @en = "The validation of the admin action challenge failed."
        super
      end
    end
    
    class CAPP012Error < CAPPError
      def initialize
        @da = "Din nøgleapp kunne ikke blive indskrefvet, da dens app id ikke eksisterer."
        @en = "Your code app could not be enrolled as the code app id does not exist."
        super
      end
    end
    
    class CAPP013Error < CAPPError
      def initialize
        @da = "Din nøgleapp kunne ikke blive indskrevet på grund af forkert software fingeraftryk eller manglende whitelist af software fingeraftryk."
        @en = "Your code app could not be enrolled due to incorrect software fingerprint or missing whitelist of software fingerprint"
        super
      end
    end
  end
end
