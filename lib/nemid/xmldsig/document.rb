require 'nokogiri'

module NemID
  module XMLDSig
    class Document
      def initialize(xml)
        @document = Nokogiri::XML(xml)
      end
    end
  end
end