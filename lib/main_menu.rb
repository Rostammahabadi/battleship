require './lib/cell'
require './lib/ship'
require './lib/board'
require 'pry'

class MainMenu

  def initialize()
    computer_board = Board.new
    computer_cruiser = Ship.new("Cruiser",3)
    computer_submarine = Ship.new("Submarine", 2)
    computer_board.place(computer_cruiser, ["A1","A2","A3"])
    computer_board.place(computer_submarine, ["C1","C2"])
    @user_board = Board.new
  end

  def start_game
    p "Welcome to BATTLESHIP"
    p "Enter p to play. Enter q to quit."
    enter = gets.chomp!
    enter

    if enter == "p"

    # def player_ship_placement
      puts "I have laid out my ships on the grid."
      puts "You now need to lay out your own two ships."
      puts "The Cruiser is three units long and the Submarine is two units long"
      puts "#{@user_board.render(true)}"

      p "Enter the squares for the Cruiser (3 spaces)"
      puts ">"
      cruiser = gets.chomp!

      cruiser_ship = Ship.new("Cruiser", 3)
      cruiser_array = []
      cruiser_array << cruiser[0..1]
      cruiser_array << cruiser[3..4]
      cruiser_array << cruiser[6..7]
      while @user_board.valid_placement?(cruiser_ship, cruiser_array) == false
        p "Those are invalid coordinates. Please try again: "
        p ">"
        cruiser = gets.chomp!
        cruiser_array = []
        cruiser_array << cruiser[0..1]
        cruiser_array << cruiser[3..4]
        cruiser_array << cruiser[6..7]
      end
      @user_board.place(cruiser_ship, cruiser_array)
    end
      p "Enter the squares for the Submarine (2 spaces)"
      puts ">"
      submarine = gets.chomp!

      submarine_ship = Ship.new("Submarine", 2)
      submarine_array = []
      submarine_array << submarine[0..1]
      submarine_array << submarine[3..4]

      while @user_board.valid_placement?(submarine_ship, submarine_array) == false
        puts "Those are invalid coordinates. Please try again: "
        puts ">"
        submarine = gets.chomp!
        submarine_array = []
        submarine_array << submarine[0..1]
        submarine_array << submarine[3..4]
      end
        @user_board.place(submarine_ship, submarine_array)
        binding.pry
      end

    end

  #end


first_game = MainMenu.new
first_game.start_game
