require './lib/cell'
require './lib/ship'
require './lib/board'
require './lib/turn'
require './lib/verify'
require 'pry'

class MainMenu

  def initialize()
    @game_over = false
    @verify = Verify.new
    @user_board = Board.new
    @computer_board = Board.new
    @user_cruiser_ship = Ship.new("Cruiser",3)
    @user_submarine_ship = Ship.new("Submarine", 2)
    @computer_cruiser_ship = Ship.new("Cruiser",3)
    @computer_submarine_ship = Ship.new("Submarine", 2)
  end#initialize

  #setup computer with randomized ship coordinates
  def setup_computer
    computer_cruiser = @computer_board.computer_cruiser.shuffle[0]
    computer_submarine = @computer_board.computer_submarine.shuffle[0]
    while(@verify.verify_no_overlap(computer_cruiser, computer_submarine) == true)
      computer_cruiser = @computer_board.computer_cruiser.shuffle[0]
      computer_submarine = @computer_board.computer_submarine.shuffle[0]
    end
    @computer_board.place(@computer_cruiser_ship, computer_cruiser)
    @computer_board.place(@computer_submarine_ship, computer_submarine)
    @computer_board.cells_containing_ships << computer_cruiser + computer_submarine
    @computer_board.cells_containing_ships = @computer_board.cells_containing_ships.flatten
  end#setup_computer

  def setup_user
    puts "I have laid out my ships on the grid."
    puts "You now need to lay out your own two ships."
    puts "The Cruiser is three units long and the Submarine is two units long"
    puts "#{@user_board.render(true)}"

    #take and store user input coordinates for cruiser
    p "Enter the squares for the Cruiser (3 spaces)"
    puts ">"
    cruiser_coords = gets.chomp.upcase
    cruiser_array = cruiser_coords.split
    #while user input coordinates are invalid, get new user input
    while @verify.cruiser_placement_coordinates(cruiser_array) == false
      p "Those are invalid coordinates. Please try again: "
      p ">"
      cruiser_coords = gets.chomp.upcase
      cruiser_array = cruiser_coords.split
    end
    @user_board.place(@user_cruiser_ship, cruiser_array)
    @user_board.cells_containing_ships << cruiser_array

    #take and store user input coordinates for submarine
    p "Enter the squares for the Submarine (2 spaces)"
    puts ">"
    submarine_coords = gets.chomp.upcase
    submarine_array = submarine_coords.split

    #while user input coordinates are invalid, get new user input
    while @verify.submarine_placement_coordinates(submarine_array) == false || @verify.verify_no_overlap(cruiser_array, submarine_array) == true
      p "Those are invalid coordinates. Please try again: "
      p ">"
      submarine_coords = gets.chomp.upcase
      submarine_array = submarine_coords.split
    end
    @user_board.place(@user_submarine_ship, submarine_array)
    @user_board.cells_containing_ships << submarine_array
    @user_board.cells_containing_ships = @user_board.cells_containing_ships.flatten
  end#setup_user

  def start_menu
    p "Welcome to BATTLESHIP"
    p "Enter p to play. Enter q to quit."
    user_input = gets.chomp

    #while menu intro input is invalid, get new input
    while @verify.menu_input(user_input) == false
      puts "invalid input"
      puts "Enter p to play. Enter q to quit."
      user_input = gets.chomp
    end

    #if input is P, setup players, loop turn until someone looses
    if user_input.upcase == "P"
      setup_computer
      setup_user

      @turn = Turn.new(@user_board, @computer_board)

      while @game_over == false do
        @turn.render_board
        @turn.prompt_user_for_input
        @turn.human_strike
        if @turn.human_lost? == true
          @game_over = true
          puts "I Win!"
        return @turn.render_board
        elsif @turn.ai_lost? == true
          @game_over = true
          puts "You Win!"
          return @turn.render_board
        end
        @turn.computer_strike
        if @turn.human_lost? == true
          @game_over = true
          puts "I Win!"
          @turn.render_board
        elsif @turn.ai_lost? == true
          @game_over = true
          puts "You Win!"
          @turn.render_board
        end
      end
    else
      p  "USER PRESSED Q"
    end
  end#start_menu
end#main_menu
