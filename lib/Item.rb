module Torz

  class Item

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
        from = File.open(File.expand_path('cache/0581dbd0e8917658ed5b641d3b037002cbe5965c.html'))
      else 
        from = open(url)
      end
      @page = Nokogiri::HTML(from)
      links = @page.css('div.download dl dt a')
      links[1..links.count].each do |link|
        href = link["href"]
        name = link.css('span').first.content
        @sources << Source.new(self, 'name', href, 'css')
      end
    end

    def inspect
      "TITEM<#{BASE_URL + @hash}>"
    end

  end

end