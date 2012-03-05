#!/usr/bin/env ruby
$LOAD_PATH << './lib'
require 'rubygems'
require 'open-uri'
require 'nokogiri'
require 'yaml'
require 'imdb'
require 'movie'

item = Steal::TItem.new('0581dbd0e8917658ed5b641d3b037002cbe5965c')
item.fetchSources
puts item.sources.inspect