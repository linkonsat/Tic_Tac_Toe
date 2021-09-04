require 'pry-byebug'
array = []
def icon_check(array)
   # binding.pry
    puts "Welcome to Tic Tac Toe player #{array.length}!. 
Enter in your letter character that you want to use"
    until ("a".."z").include?(variable_icon = gets.chomp) || ("A".."Z").include?(variable_icon = gets.chomp) do
        puts "You put a invalid character. Enter a single letter character" 
    end     

    array.push(Players.new(variable_icon[0]))
    
end



class Players
    attr_accessor :player_icon

    def initialize (player_icon)
        @player_icon = player_icon
    end

  
end

2.times do
icon_check(array)
end
p array
 #module GameBoard
 #   gameboard =
 #   [0,0,0,
 #    0,0,0,
  #   0,0,0,
  #  ]
#end