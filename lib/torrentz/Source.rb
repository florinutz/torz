module Torz

  module Torrentz
  
    class Source
  
      attr_accessor :item, :site, :url, :css
  
      def initialize item, site, url, css
        @item, @name, @url, @css = item, name, url, css
      end
  
      def self.getFile
        
      end
  
      def self.download full_url, to_here
        require 'open-uri'
        writeOut = open(to_here, "wb")
        writeOut.write(open(full_url).read)
        writeOut.close
      end
       
      def inspect
        "TSOURCE<#@name-#@url>"
      end 
      
    end
  
  end

end