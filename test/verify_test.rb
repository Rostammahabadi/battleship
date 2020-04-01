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

  def test_no_repeated_coords
    cell1 = Cell.new("A1")
    cell2 = Cell.new("A2")
    assert_equal true, @verify.verify_no_repeated_coordinate(cell1)
    assert_equal true, @verify.verify_no_repeated_coordinate(cell2)
    cell1.fire_upon
    cell2.fire_upon
    assert_equal false, @verify.verify_no_repeated_coordinate(cell1)
    assert_equal false, @verify.verify_no_repeated_coordinate(cell2)
  end

  def test_verify_runner_input
    assert_equal false, @verify.verify_runner_input("7y")
    assert_equal false, @verify.verify_runner_input("n.")
    assert_equal true, @verify.verify_runner_input("y")
    assert_equal true, @verify.verify_runner_input("N")
  end

end
