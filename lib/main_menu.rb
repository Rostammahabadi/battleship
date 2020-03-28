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
    @cruiser_ship = Ship.new("Cruiser",3)
    @submarine_ship = Ship.new("Submarine", 2)
  end#initialize

  #setup computer with hardcoded ship coordinates
  def setup_computer
    @computer_board.place(@cruiser_ship, ["A1","A2","A3"])
    @computer_board.place(@submarine_ship, ["C1","C2"])
    @computer_board.cells_containing_ships << ["A1","A2","A3","C1","C2"]
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
    cruiser_coords = gets.chomp!
    cruiser_array = []
    cruiser_array << cruiser_coords[0..1]
    cruiser_array << cruiser_coords[3..4]
    cruiser_array << cruiser_coords[6..7]
    while @user_board.valid_placement?(@cruiser_ship, cruiser_array) == false
      p "Those are invalid coordinates. Please try again: "
      p ">"
      cruiser = gets.chomp!
      cruiser_array = []
      cruiser_array << cruiser[0..1]
      cruiser_array << cruiser[3..4]
      cruiser_array << cruiser[6..7]
    end
    @user_board.place(@cruiser_ship, cruiser_array)
    @user_board.cells_containing_ships << cruiser_array

    #take and store user input coordinates for submarine
    p "Enter the squares for the Submarine (2 spaces)"
    puts ">"
    submarine = gets.chomp!
    submarine_array = []
    submarine_array << submarine[0..1]
    submarine_array << submarine[3..4]

    while @user_board.valid_placement?(@submarine_ship, submarine_array) == false
      puts "Those are invalid coordinates. Please try again: "
      puts ">"
      submarine = gets.chomp!
      submarine_array = []
      submarine_array << submarine[0..1]
      submarine_array << submarine[3..4]
    end
    @user_board.place(@submarine_ship, submarine_array)
    @user_board.cells_containing_ships << submarine_array
    @user_board.cells_containing_ships = @user_board.cells_containing_ships.flatten
  end#setup_user

  def start_menu
    p "Welcome to BATTLESHIP"
    p "Enter p to play. Enter q to quit."
    user_input = gets.chomp!

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
        @turn.game_turn
        if @turn.final_turn? == true
          @game_over = true
        end
      end
      p "END OF GAME MESSAGE"
    else
      p  "USER PRESSED Q"
    end
  end#start_menu
end#main_menu
