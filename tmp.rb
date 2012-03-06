#!/usr/bin/env ruby

require 'rubygems'
require 'nokogiri'
require 'net/http'

# doc = Nokogiri::HTML(open('/home/florin/Desktop/torrent.html'))
# puts doc.css('div.content-rounded table.lista td.lista a').first['href']

# http://rarbg.com/torrents/filmi/download/fc72cdf70089961c33b05a7d3b2e34870f2eae52/torrent.html
def get_torrent_link html
  doc = Nokogiri::HTML(html)
  return doc.css('div.content-rounded table.lista td.lista a').first['href']
end

def obtain myUrl
  url = URI.parse( myUrl )
  if url.host
    http = Net::HTTP.new( url.host, url.port )
    http.use_ssl = true if url.port == 443
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE if url.port == 443
    res, data = http.get2(
      ( url.path ? url.path : '/' ) + ( url.query ? "?"+url.query : '' ), 
      {'User-Agent' => 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.0.1) Gecko/20060111 Firefox/1.5.0.1'}
    )
    return data if [Net::HTTPSuccess, Net::HTTPRedirection].include? res
  elsif File.exists? myUrl
    return File.open(myUrl)
  end
  return false
end

puts obtain('http://rarbg.com/torrents/filmi/download/fc72cdf70089961c33b05a7d3b2e34870f2eae52/torrent.html')
# get_torrent_link http_get '/home/florin/Desktop/torrent.html'