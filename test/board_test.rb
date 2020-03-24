require 'minitest/autorun'
require 'minitest/pride'
require './lib/cell'
require './lib/ship'
require '.lib/board'

class BoardTest < Minitest::Test

  def test_instance_of_board

    assert_instnace_of board = Board.new

  end

  def test_board_has_cells_in_hash_type
    board = Board.new
    board.cells

    assert_equal Hash, board.class
  end

  def test_validating_coordinates
    board = Board.new

    assert_equal true, board.valid_coordinate?("A1")
    assert_equal true, board.valid_coordinate?("D4")
  end
