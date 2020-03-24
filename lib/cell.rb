require './lib/ship'

class Cell
  attr_reader :coordinate, :ship

  #initialze with given coordinate name and other attributes
  def initialize(cooridnate_name)
    @coordinate = cooridnate_name
    @ship = nil
    @empty = true
    @fired_upon = false
  end

  #returns empty status
  def empty?
    @empty
  end

  #stores placed ship in @ship, change @empty to false
  def place_ship(ship_being_placed)
    @ship = ship_being_placed
    @empty = false
  end

  #returns @fired_upon status
  def fired_upon?
    @fired_upon
  end

  #use .hit to remove one point from ship health
  #chnage @fired_upon to true
  def fire_upon
    if @empty == false
      @ship.hit
      @fired_upon = true
    else
      @fired_upon = true
    end
  end

  def render
    if fired_upon? == false
      return '.'
    elsif fired_upon? == true && @empty == true
      return 'M'
    elsif fired_upon? == true && @empty == false && @ship.sunk? == false
      return "H"
    elsif fired_upon? == true && @ship.sunk? == true
    return "X"
  end
end

end
