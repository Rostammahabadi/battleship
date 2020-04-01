require 'minitest/autorun'
require 'minitest/pride'
require './lib/cell'
require './lib/ship'
require './lib/board'
require './lib/verify'

class VerifyTest < Minitest::Test
  def setup
    @verify = Verify.new
  end

  def test_menu_input_verification
    assert_equal false, @verify.menu_input("P[")
    assert_equal true, @verify.menu_input("p")
    assert_equal true, @verify.menu_input("P")
    assert_equal false, @verify.menu_input(" ")
    assert_equal true, @verify.menu_input("q")
    assert_equal true, @verify.menu_input("Q")
  end

  def test_coordinate_input
    assert_equal false, @verify.coordinate_input("A12")
    assert_equal false, @verify.coordinate_input("A1 A2")
    assert_equal true, @verify.coordinate_input("A1")
  end

  def test_verify_no_overlap
    assert_equal true, @verify.verify_no_overlap(["A1", "A2", "A3"], ["A1", "B1"])
    assert_equal false, @verify.verify_no_overlap(["A1", "A2", "A3"], ["B1", "B2"])
  end


end
