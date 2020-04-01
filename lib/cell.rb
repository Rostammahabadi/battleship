require './lib/ship'

class Cell
  attr_reader :coordinate, :ship, :empty

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
    end
    @fired_upon = true
  end

  def render(show = true)
    if fired_upon? == false && @empty == true
      return '.'
    elsif fired_upon? == false && @empty == false && show == true
      return 'S'
    elsif fired_upon? == false && @empty == false && show == false
      return '.'
    elsif fired_upon? == true && @empty == true
      return 'M'
    elsif fired_upon? == true && @empty == false && @ship.sunk? == false
      return "H"
    elsif fired_upon? == true && @empty == false && @ship.sunk? == true
    return "X"
  end
end
  def hit_or_miss_or_sunk_human
    if @empty == false && @fired_upon == true && @ship.sunk? == false
      p "Your shot on #{coordinate} was a hit."
    elsif @empty == true && @fired_upon == true
      p "Your shot on #{coordinate} was a miss."
    elsif @empty == false && @ship.sunk? == true
      p "Your shot on #{coordinate} sunk my #{@ship.ship_type}."
    end
  end

  def hit_or_miss_or_sunk_computer
    if @empty == false && @fired_upon == true && @ship.sunk? == false
      p "My shot on #{coordinate} was a hit."
    elsif @empty == true && @fired_upon == true
      p "My shot on #{coordinate} was a miss."
    elsif @empty == false && @ship.sunk? == true
      p "My shot on #{coordinate} sunk my #{@ship.ship_type}."
  end
end
end
