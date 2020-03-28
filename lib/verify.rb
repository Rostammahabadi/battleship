class Verify

  #validate menu input is 'P' or 'Q'
  def menu_input(input)
    if input.upcase == "P" || input.upcase == "Q"
      true
    else
      false
    end
  end#menu_input
end#Verify
