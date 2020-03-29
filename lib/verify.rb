class Verify

  def initialize
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    @valid_coordinates = @board.cells.map{|cell| cell[0]}
  end#initialize

  #validate menu input is 'P' or 'Q'
  def menu_input(input)
    input.upcase == "P" || input.upcase == "Q"
  end#menu_input

  #validate given argument is a valide cell cordinate
  def coordinate_input(coordinate)
    @valid_coordinates.any?{|coord| coord == coordinate}
  end#coordinate_input

  def cruiser_placement_coordinates(inputted_coordinates)
    if inputted_coordinates.length == 3
      inputted_coordinates.all?{|coord| coordinate_input(coord) == true} && @board.valid_placement?(@cruiser, inputted_coordinates) == true
    end
  end

  #validate input coordinates for submarine are == 2 and ...
  #they are valid coordinate that can be legally placed on board.
  def submarine_placement_coordinates(inputted_coordinates)
    if inputted_coordinates.length == 2
      inputted_coordinates.all?{|coord| coordinate_input(coord) == true} && @board.valid_placement?(@submarine, inputted_coordinates) == true
    end
  end

end#Verify
