
class Turn
  attr_reader :turn_type

  def initialize(human_board, ai_board)
    @turn_number = 0
    @human_board = human_board
    @ai_board = ai_board
    @ai_fire_order = @ai_board.cells.map {|cell| cell[0]}.shuffle
  end


  def game_turn
    puts "=============COMPUTER BOARD============="
    puts @ai_board.render(false)
    puts "==============PLAYER BOARD=============="
    puts @human_board.render(true)
    puts "Which coordinate would you like to strike?"
    strike_coordinates = gets.chomp
    @ai_board.cells[strike_coordinates].fire_upon
    @human_board.cells[@ai_fire_order[@turn_number]].fire_upon
    @turn_number += 1
  end

  def final_turn?
    human_ship_cells = @human_board.cells_containing_ships.map {|key| @human_board.cells[key].fired_upon?}
    ai_ship_cells = @ai_board.cells_containing_ships.map {|key| @ai_board.cells[key].fired_upon?}

    if (human_ship_cells.all? {|fired_upon_status| fired_upon_status == true}) == true ||
      (ai_ship_cells.all? {|fired_upon_status| fired_upon_status == true}) == true
      puts "GAME OVER"
      true
    else
      false
    end
  end
end
