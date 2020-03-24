require 'minitest/autorun'
require 'minitest/pride'
require './lib/cell'
require './lib/ship'

class ShipTest < Minitest::Test

  def test_coordinate_return
    cruiser = Ship.new("Cruiser", 3)

    assert_equal "B4", cell.coordinate
  end

end
