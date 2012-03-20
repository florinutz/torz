#!/usr/bin/env ruby
$LOAD_PATH << './lib'
%w{rubygems open-uri nokogiri yaml imdb lib/_loader.rb}.each{ |lib| require lib }

# item = Steal::TItem.new('0581dbd0e8917658ed5b641d3b037002cbe5965c')
# item.fetchSources
# puts item.sources.inspect


rarbg = Torz::Rarbg.new
puts rarbg.name
