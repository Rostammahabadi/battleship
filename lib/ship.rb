class Ship

  attr_reader :length, :ship_type, :health

  def initialize(ship_type, length)
    @ship_type = ship_type
    @length = length
    @health = length
  end

end
