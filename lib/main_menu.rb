require './lib/cell'
require './lib/ship'
require './lib/board'
require 'pry'

class MainMenu

  def initialize


    p "Welcome to BATTLESHIP"
    p "Enter p to play. Enter q to quit."
    enter = gets.chomp!

    if enter == "p"
      puts "I have laid out my ships on the gril."
      puts "You now need to lay out your own two ships."
      puts "The Cruiser is three units long and the Submarine is two units long"
      puts "#{Board.new.render(true)}"

      p "Enter the squares for the Cruiser (3 spaces)"
      puts ">"
      cruiser = gets.chomp!
      user_board = Board.new
      cruiser_ship = Ship.new("Cruiser", 3)
      cruiser_array = []
      cruiser_array << cruiser[0..1]
      cruiser_array << cruiser[3..4]
      cruiser_array << cruiser[6..7]
      if user_board.valid_placement?(cruiser_ship, cruiser_array)

        user_board.place(cruiser, cruiser_array)
      end

        p "Enter the squares for the Submarine (2 spaces)"
        puts ">"
        submarine = gets.chomp!
        submarine_ship = Ship.new("Submarine", 2)
        submarine_array = []
        submarine_array << submarine[0..1]
        submarine_array << submarine[3..4]
        submarine_array << submarine[6..7]

        if user_board.valid_placement?(submarine_ship, submarine_array)

          user_board.place(submarine_ship, submarine_array)
        end

    end

    if enter == "q"
      return
    end

  end

end

MainMenu.new