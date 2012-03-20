module Torz
module Torrentz
  
  class Site

    attr_accessor :name, :root_url, :leaf_pattern

    def initialize name, root_url, leaf_pattern = nil
      @name, @root_url, @leaf_pattern = name, root_url, leaf_pattern
    end

  end
  
end end