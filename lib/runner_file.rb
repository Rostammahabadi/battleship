require './lib/main_menu'
input = "y"
while input == "y"
  main = MainMenu.new
  main.start_menu

  p "Would you like to play again? Press y to play again and n to quit."
  input = gets.chomp
end
