
class Turn
  attr_reader :turn_type

  def initialize(human_board, ai_board)
    @turn_type = "human"
    @human_board = human_board
    @ai_board = ai_board
  end

  def play_turn(turn_type)
    if turn_type == "human"
      human_turn
      @turn_type = "ai"
    else
      ai_turn
      @turn_type = "human"
    end
  end

  def human_turn
    # binding.pry
    puts @ai_board.render(true)
    puts "Which coordinate would you like to strike?"
    strike_coordinates = gets.chomp
    @ai_board.cells[strike_coordinates].fire_upon
    puts @ai_board.render(true)
    p "DAMAGE REPORT GOES HERE"
  end

  def ai_turn
    p "AI TURN"
  end

  def final_turn?
    human_ship_cells = @human_board.cells_containing_ships.map {|key| @human_board.cells[key].fired_upon?}
    ai_ship_cells = @ai_board.cells_containing_ships.map {|key| @ai_board.cells[key].fired_upon?}

    # binding.pry

    if (human_ship_cells.all? {|fired_upon_status| fired_upon_status == true}) == true ||
      (ai_ship_cells.all? {|fired_upon_status| fired_upon_status == true}) == true
      puts "GAME OVER"
      true
    else
      false
    end




  end#final_turn




end
