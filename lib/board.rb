class Board
  attr_reader :cells, :computer_submarine, :computer_cruiser
  attr_accessor :cells_containing_ships

  def initialize

    cell1 = Cell.new("A1")
    cell2 = Cell.new("A2")
    cell3 = Cell.new("A3")
    cell4 = Cell.new("A4")
    cell5 = Cell.new("B1")
    cell6 = Cell.new("B2")
    cell7 = Cell.new("B3")
    cell8 = Cell.new("B4")
    cell9 = Cell.new("C1")
    cell10 = Cell.new("C2")
    cell11 = Cell.new("C3")
    cell12 = Cell.new("C4")
    cell13 = Cell.new("D1")
    cell14 = Cell.new("D2")
    cell15 = Cell.new("D3")
    cell16 = Cell.new("D4")

    @cells = {
      "A1"=> cell1, "A2"=> cell2, "A3"=> cell3, "A4"=> cell4,
      "B1"=> cell5, "B2"=> cell6, "B3"=> cell7, "B4"=> cell8,
      "C1"=> cell9, "C2"=> cell10, "C3"=> cell11, "C4"=> cell12,
      "D1"=> cell13, "D2"=> cell14, "D3"=> cell15, "D4"=> cell16
    }

    @computer_submarine = [
["A1","B1"],["A2","B2"],["A3","B3"],["A4","B4"],["A1","A2"],["A2","A3"],["A3","A4"],["B1","B2"],["B2","B3"],["B3","B4"],["C1","C2"],["C2","C3"],["C3","C4"],["D1","D2"],["D2","D3"],["D3","D4"],["B1","C1"],["B2","C2"],["B3","C3"],["B4","C4"],["C1","D1"],["C2","D2"],["C3","D3"],["C4","D4"]
]

    @computer_cruiser = [
["A1", "B1", "C1"],["A2","A3","A4"],["B1","B2","B3"],["B2","B3","B4"],["C1","C2","C3"],["C2","C3","C4"],["D1", "D2", "D3"], ["D2","D3","D4"],["A1","B1","C1"],["A2","B2","C2"],["A3","B3","C3"],["A4","B4","C4"],["B1","C1","D1"],["B2","C2","D2"],["B3","C3","D3"],["B4","C4","D4"]]

    @cells_containing_ships = []

  end

  #check passed coordinate (key) exists in @cells (hash)
  def valid_coordinate?(coordinate)
    @cells[coordinate] == nil
  end

  #checks the following:
  #ship length == number of coordinates,
  #if coorinates have same letters (A1, A2), they have sequential numbers
  #if coordinates have sequential letters (A1, D1), they have the same numbers
  def valid_placement?(ship, coordinates_array)
    #tracks if previous coord iteration was "same" or "different"
    situation = " "
    #tracks if coordinate is valid or not
    valid = true
    #checks ship length vs num coordinates
    if coordinates_array.length != ship.length
      false
    else
      if coordinates_array.all? {|coor| @cells[coor].empty?} == true
        coordinates_array.each_cons(2) do |coord1, coord2|
          #enters here if coord letters are the same
          if coord1[0] == coord2[0] && situation != "different"
            situation = "same"
            #checks numbers sequential
            if coord1[1].to_i != (coord2[1].to_i-1)
              valid = false
              break
            end
          #enters here if letters are sequential
          elsif (coord1[0].ord == (coord2[0].ord - 1)) && (situation != "same")
            situation = "different"
            #checks numbers the same
            if coord1[1] != coord2[1]
              valid = false
              break
            end
          else
            valid = false
            break
          end
        end
        #returns valid
        valid
      else
        valid = false
      end
    end

    end

  def place(ship, location)
    location.each do |loc|
      @cells.each do |coordinate, cell|
        if loc == coordinate && cell.empty == true
          cell.place_ship(ship)
        end
      end
    end

  end

  def render(show = false)
    "  1 2 3 4 \nA #{cells["A1"].render(show)} #{cells["A2"].render(show)} #{cells["A3"].render(show)} #{cells["A4"].render(show)} \nB #{cells["B1"].render(show)} #{cells["B2"].render(show)} #{cells["B3"].render(show)} #{cells["B4"].render(show)} \nC #{cells["C1"].render(show)} #{cells["C2"].render(show)} #{cells["C3"].render(show)} #{cells["C4"].render(show)} \nD #{cells["D1"].render(show)} #{cells["D2"].render(show)} #{cells["D3"].render(show)} #{cells["D4"].render(show)} \n"
end

end
