#!/usr/bin/env ruby
$LOAD_PATH << './lib'
require 'movie'

movie = Steal::Movie.new
puts movie.search