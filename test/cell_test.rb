require 'minitest/autorun'
require 'minitest/pride'
require './lib/cell'
require './lib/ship'

class ShipTest < Minitest::Test

  def test_coordinate_return
    cell = Cell.new("B4")

    assert_equal "B4", cell.coordinate
  end

  def test_there_is_no_ship
    cruiser = Ship.new("Cruiser", 3)
    cell = Cell.new("B4")

    assert_nil cell.ship
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

   def test_cell_render_empty
     #initialize instances
     cell1 = Cell.new("A4")
     #test empty board render
     assert_equal ".", cell1.render
     cell1.fire_upon
     assert_equal "M", cell1.render
   end

   def test_cell_render_ship_placed
     #initialze instances
     cell1 = Cell.new("A4")
     cell2 = Cell.new("B4")
     cell3 = Cell.new("C4")
     cell4 = Cell.new("D4")
     cruiser = Ship.new("Cruiser", 3)
     #test render with placed ship
     cell2.place_ship(cruiser)
     cell3.place_ship(cruiser)
     cell4.place_ship(cruiser)
     assert_equal "S", cell2.render
     assert_equal ".", cell2.render(false)
     #test sinking scenareo
     cell2.fire_upon
     assert_equal "H", cell2.render
     cell3.fire_upon
     assert_equal "H", cell2.render
     assert_equal "H", cell3.render
     cell4.fire_upon
     assert_equal "X", cell2.render
     assert_equal "X", cell3.render
     assert_equal "X", cell4.render
     assert_equal ".", cell4.render(false)
   end

end
