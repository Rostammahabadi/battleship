class Board
  attr_reader :cells

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

    @board_numerical = { "A1"=> 1, "A2"=> 2, "A3"=> 3, "A4"=> 4,
    "B1"=> 5, "B2"=> 6, "B3"=> 7, "B4"=> 8,
    "C1"=> 9, "C2"=> 10, "C3"=> 11, "C4"=> 12,
    "D1"=> 13, "D2"=> 14, "D3"=> 15, "D4"=> 16}

  end

  #check passed coordinate (key) exists in @cells (hash)
  def valid_coordinate?(coordinate)
    if @cells[coordinate] == nil
      false
    else
      true
    end
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
    p "  1 2 3 4 \nA #{cells["A1"].render(show)} #{cells["A2"].render(show)} #{cells["A3"].render(show)} #{cells["A4"].render(show)} \nB #{cells["B1"].render(show)} #{cells["B2"].render(show)} #{cells["B3"].render(show)} #{cells["B4"].render(show)} \nC #{cells["C1"].render(show)} #{cells["C2"].render(show)} #{cells["C3"].render(show)} #{cells["C4"].render(show)} \nD #{cells["D1"].render(show)} #{cells["D2"].render(show)} #{cells["D3"].render(show)} #{cells["D4"].render(show)} \n"
end

end
