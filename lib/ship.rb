class Ship

  attr_reader :length, :ship_type, :health

  def initialize(ship_type, length)
    @ship_type = ship_type
    @length = length
    @health = length
  end

  def hit
    @health -= 1
  end

  def sunk?
    return true if @health == 0
    return false if @health > 0
  end

end
