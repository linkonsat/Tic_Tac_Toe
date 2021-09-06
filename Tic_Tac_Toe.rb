require 'pry-byebug'
array = []
def icon_check(array)
   # binding.pry
    puts "Welcome to Tic Tac Toe player #{array.length}!. 
Enter in your letter character that you want to use"
    until ("a".."z").include?(variable_icon = gets.chomp) || ("A".."Z").include?(variable_icon) && variable_icon.length == 1 do
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

 class GameBoard
    #includes initial gameboard and win checks
    attr_accessor :board
    def initialize(board)
    @board = board 
    end
    def win_check_columns
    end

    def win_check_rows

    end

    def win_check_diagonals

    end

    def round
    end
end

    class Game
        #creates a updated gameboard that resets the board
        #once a player wins and also puts a display of the current board


        def initialize(play)
        
        end

        def play_again
        end
        def game_state
            #returns a copy of the current board
        end

        def round
        end
    end
    
    board = GameBoard.new([0,1,2,
        3,4,5,
        6,7,8,
       ])
 