class Turn


  def initialize(human_board, ai_board)
    @turn_number = 0
    @verify = Verify.new
    @ai_board = ai_board
    @human_board = human_board
    @ai_fire_order = @ai_board.cells.map {|cell| cell[0]}.shuffle
  end

  def render_board
    puts "=============COMPUTER BOARD============="
    puts @ai_board.render(false)
    puts "==============PLAYER BOARD=============="
    puts @human_board.render(true)
  end

  def prompt_user_for_input
    puts "Which coordinate would you like to strike?"
    @strike_coordinate = gets.chomp.upcase

    while @verify.coordinate_input(@strike_coordinate) == false
      puts "invalid input"
      puts "Which coordinate would you like to strike?"
      @strike_coordinate = gets.chomp.upcase
    end
    # verify the user hasn't entered that cell previously
    while @verify.verify_no_repeated_coordinate(@ai_board.cells[@strike_coordinate]) == false
      puts "You already struck that cell"
      puts "Choose another coordinate"
      @strike_coordinate = gets.chomp.upcase
    end
  end

  def computer_strike
    @human_board.cells[@ai_fire_order[@turn_number]].fire_upon
    @human_board.cells[@ai_fire_order[@turn_number]].hit_or_miss_or_sunk_computer
    @turn_number += 1
  end

  def human_strike
    @ai_board.cells[@strike_coordinate].fire_upon
    @ai_board.cells[@strike_coordinate].hit_or_miss_or_sunk_human
  end

  # separated out human_ship_cells within final_turn? to their own methods for clarity
  def human_lost?
    human_ship_cells = @human_board.cells_containing_ships.map {|key| @human_board.cells[key].fired_upon?}
    if human_ship_cells.all? {|fired_upon_status| fired_upon_status == true} == true
      return true
    end
  end
  #separated out ai_ship_cells within final_turn? to their own methods for clarity
  def ai_lost?
    ai_ship_cells = @ai_board.cells_containing_ships.map {|key| @ai_board.cells[key].fired_upon?}
    if ai_ship_cells.all? {|fired_upon_status| fired_upon_status == true} == true
      return true
    end
  end
  # Returns integer to display winner in main_menu.rb
  # def final_turn?
  #   human_lost?
  #   ai_lost?
  #   return 0 if human_lost?.all? {|fired_upon_status| fired_upon_status == true} == true
  #   return 1 if ai_lost?.all? {|fired_upon_status| fired_upon_status == true} == true
  #
  # end

end
