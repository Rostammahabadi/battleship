require './lib/main_menu'
input = "Y"
while input == "Y"
  main = MainMenu.new
  main.start_menu

  p "Would you like to play again? Press y to play again and n to quit."
  input = gets.chomp.upcase
end
