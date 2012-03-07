module Torz
  
  class Site
      
    attr_accessor :name, :root_url, :leaf_pattern
    
    def initialize name, leaf_pattern
      @name, @leaf_pattern = name, leaf_pattern
    end
    
  end

end