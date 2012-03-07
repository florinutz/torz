module Torz

  class Source

    attr_accessor :item, :url, :css, :name

    def initialize item, name, url, css
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