require 'minitest/autorun'
require 'minitest/pride'
require './lib/cell'
require './lib/ship'

class ShipTest < Minitest::Test

  def test_coordinate_return
    cell = Cell.new("B4")

    assert_equal "B4", cell.coordinate
  end

  def test_coordinate_return
    cell = Cell.new("B4")

    assert_equal "B4", cell.coordinate
  end

  def test_there_is_no_ship
    cruiser = Ship.new("Cruiser", 3)
    cell = Cell.new("B4")

    assert_equal nil, cell.ship
  end

  def test_the_cell_is_empty
    cruiser = Ship.new("Cruiser", 3)
    cell = Cell.new("B4")

    assert_equal true, cell.empty?
  end

  def test_cell_shows_ship_after_placement
    cruiser = Ship.new("Cruiser", 3)
    cell = Cell.new("B4")
    cell.place_ship(cruiser)

     assert_instance_of Ship, cell.ship
   end

   def test_empty_updates_after_placement
     cruiser = Ship.new("Cruiser", 3)
     cell = Cell.new("B4")
     cell.place_ship(cruiser)

     assert_equal false, cell.empty?
   end

   def test_cell_knows_when_it_has_been_fired_upon
     cruiser = Ship.new("Cruiser", 3)
     cell = Cell.new("B4")
     cell.place_ship(cruiser)
     cell.fire_upon

     assert_equal 2, cell.ship.health
     assert_equal true, cell.fired_upon?
   end

end
