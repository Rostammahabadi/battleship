require 'minitest/autorun'
require 'minitest/pride'
require './lib/cell'
require './lib/ship'
require './lib/board'
require 'pry'

class BoardTest < Minitest::Test

  def test_instance_of_board

    assert_instance_of Board, board = Board.new

  end

  def test_board_has_cells_in_hash_type
    board = Board.new
    board.cells

    assert_equal Hash, board.cells.class
  end

  def test_validating_coordinates
    board = Board.new

    assert_equal true, board.valid_coordinate?("A1")
    assert_equal true, board.valid_coordinate?("D4")
  end

  def test_valid_placement_length_vs_coordinates
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    assert_equal false, board.valid_placement?(cruiser, ["A1", "B1"])
    assert_equal true, board.valid_placement?(submarine, ["D2", "D3"])
  end

  def test_valid_placement_consecutive
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    assert_equal true, board.valid_placement?(cruiser, ["A1", "B1", "C1"])
    assert_equal false, board.valid_placement?(cruiser, ["A1", "A2", "B2"])
    assert_equal false, board.valid_placement?(cruiser, ["A1", "B1", "B2"])
  end

  def test_valid_placement_no_diagonal
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    assert_equal false, board.valid_placement?(cruiser, ["A1", "B2", "C3"])
    assert_equal false, board.valid_placement?(submarine, ["C2", "D3"])
  end

  def test_placing_ships
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    cell_1 = board.cells["A1"]
    cell_2 = board.cells["A2"]
    cell_3 = board.cells["A3"]
    assert_equal true, cell_3.ship == cell_2.ship
  end

  def test_overlapping_ships
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    board.place(cruiser, ["A1", "A2", "A3"])
    submarine = Ship.new("Submarine", 2)

    refute board.valid_placement?(submarine, ["A1", "B1"])
  end

  def test_rendering_hidden_ship
    board.place(cruiser, ["A1", "A2", "A3"])
    expected_return = "  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n"
    assert_equal expected_return, board.render
  end

end
