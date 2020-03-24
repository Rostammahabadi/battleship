require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'

class ShipTest < Minitest::Test

  def setup
    @sub = Ship.new('sub', 2)
  end

  #tests that instances of Ship initialze with a type, length, and health
  def test_initialization
    assert_equal 2, @sub.length
    assert_equal 'sub', @sub.ship_type
    assert_equal 2, @sub.health
  end

  #tests that hit method removes 1 from health
  def test_hit
    @sub.hit
    assert_equal 1, @sub.health
  end

  #test that sunk detects when health == 0
  def test_sunk?
    @sub.hit
    assert_equal false, @sub.sunk?
    @sub.hit
    assert_equal true, @sub.sunk?
  end

end
