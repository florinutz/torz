module Steal
  
  class TorrentzItem
  
  class Movie < TorrentzItem
    require 'imdb'
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
