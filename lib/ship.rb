class Ship
  attr_reader :health, :length, :ship_type

  #initialze with a ship_type, length, and health
  def initialize(ship_type, length)
    @ship_type = ship_type
    @length = length
    @health = length
  end

  #remove 1 point from health
  def hit
    @health -= 1
  end

  #returns true if health == 0
  def sunk?
    if @health == 0
      true
    else
      false
    end
  end

end
