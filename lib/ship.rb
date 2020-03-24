class Ship
  attr_reader :health, :length, :ship_type

  #initialze with a ship_type, length, and health
  def initialize(ship_type, length)
    @ship_type = ship_type
    @length = length
    @health = length
  end

end
