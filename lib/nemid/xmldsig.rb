require 'xmldsig'

module NemID
  module XMLDSig
    NAMESPACES = {
      'ds' => 'http://www.w3.org/2000/09/xmldsig#',
      'openoces' => 'http://www.openoces.org/2006/07/signature#',
      "ec"  => "http://www.w3.org/2001/10/xml-exc-c14n#",
      "wsu" => "http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd"
    }
    
    # The "referenced_node" method needs to be overridden since NemID uses 
    # "Id" (as opposed to ID or wsu:Id) as the attribute name in the "Signature" 
    # element of the XML document.
    Xmldsig::Reference.class_eval do
      def referenced_node
        if reference_uri && reference_uri != ""
          id = reference_uri[1..-1]
          if ref = document.dup.at_xpath("//*[@ID='#{id}' or @Id='#{id}' or @wsu:Id='#{id}']", NAMESPACES)
            ref
          else
            raise(
                ReferencedNodeNotFound,
                "Could not find the referenced node #{id}'"
            )
          end
        else
          document.dup.root
        end
      end
    end
  end
end

require_relative "xmldsig/document"