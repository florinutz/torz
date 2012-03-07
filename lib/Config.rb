module Torz
  
  TESTING = true

  class Config
    
    require 'open-uri'
    require 'yaml'
    
    attr_accessor :file, :yml
    
    def initialize file = File.expand_path('config/sources.yml')
      @file, @yml = file, YAML.load_file(file);
      yml.each do |key, val|
        yml[key] = Regexp.new(val["url"], Regexp::IGNORECASE) if val.has_key? 'url'
      end
    end
    
    def inspect
      "TCONF<#@file>"
    end
  
  end

end
