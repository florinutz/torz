module Steal
  
  TESTING = true
  
  class TItem
   
    attr_accessor :hash, :page, :sources
    
    BASE_URL = 'http://torrentz.eu/'
    
    def initialize hash
      @hash, @sources = hash, []
    end
    
    def url
      BASE_URL + @hash
    end
    
    def fetchSources
      require 'rubygems'
      require 'open-uri'
      require 'nokogiri'
      if TESTING
        from = File.open('/home/florin/workspace/torz/cache/0581dbd0e8917658ed5b641d3b037002cbe5965c.html')
      else 
        from = open(url)
      end
      @page = Nokogiri::HTML(from)
      links = @page.css('div.download dl dt a')
      links[1..links.count].each do |link|
        href = link["href"]
        name = link.css('span').first.content
        @sources << TSource.new(self, 'name', href, 'css')
      end
    end
    
    def inspect
      "TItem object with url #{BASE_URL + @hash}"
    end
    
  end
  
  
  class TSource

    attr_accessor :item, :url, :css, :name

    def initialize item, name, url, css
      @item, @name, @url, @css = item, name, url, css
    end

    def self.getFile url, css, saveTo
      
    end

    def self.download full_url, to_here
      require 'open-uri'
      writeOut = open(to_here, "wb")
      writeOut.write(open(full_url).read)
      writeOut.close
    end
     
    def inspect
      "\nTSOURCE<#@name-#@url>"
    end 
    
  end
  
  
  class TConfig
    require 'yaml'
    def initialize file='../config/sources.yml'
      yml = YAML.load_file(file);
    end
  end
  
  
  class Movie < TItem
    attr_accessor :imdb
    def initialize()
    end
    def search
      raise ArgumentError, 'Search what?' unless @imdb
      search = Imdb::Search.new(@imdb)
    end
    def inspect
      "#{@title}"
    end
    def caca
      
    end
    protected :caca
  
  end

end
