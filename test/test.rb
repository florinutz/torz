$LOAD_PATH << '../lib'
require_relative '../lib/_loader.rb'
require 'test/unit'

class TestItem < Test::Unit::TestCase

  def test_simple
    hash = 'some_hash_here'
    assert_equal "http://torrentz.eu/#{hash}", Item.new(hash).url
  end

end