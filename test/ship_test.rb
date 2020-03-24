require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'

class ShipTest < Minitest::Test

  def setup
    @sub = Ship.new('sub', 2)
  end

  def test_initialization
    assert_equal 2, @sub.length
    assert_equal 'sub', @sub.ship_type
    assert_equal 2, @sub.health
  end

end
