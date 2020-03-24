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
    
end
