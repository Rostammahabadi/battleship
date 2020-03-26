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
      binding.pry

    end

    if enter == "q"
      return
    end

  end

end

MainMenu.new
