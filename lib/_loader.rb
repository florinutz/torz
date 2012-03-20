%w{
  Config.rb
  torrentz/Item.rb torrentz/Site.rb torrentz/Source.rb
  sites/rarbg.rb
}.each { |file| require_relative file }

DEV = true
