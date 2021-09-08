# frozen_string_literal: true
require 'pry-byebug'
module GameRules
    def win (board,player_symbol)
      
        winning_condition = [player_symbol,player_symbol,player_symbol]
        
        board_condition = [board.values_at(1,2,3), board.values_at(4,5,6),
                            board.values_at(7,8,9), board.values_at(1,4,7),
                            board.values_at(2,5,8), board.values_at(3,6,9),
                            board.values_at(1,5,9), board.values_at(3,5,7)]
         if (board_condition.include?(winning_condition))
            return true
         end
    end
end
class Players
    attr_accessor :player_icon

    def initialize (player_icon)
        @player_icon = player_icon
    end

  
end

 class GameBoard
    #includes initial gameboard and win checks
    attr_accessor :board
    include GameRules
    def initialize(board)
    @board = board 
    end

    def player_move (player_symbol,position)

        board[position] = player_symbol

    end
end




    

def icon_check(array)
   # binding.pry
puts "Welcome to Tic Tac Toe player #{array.length}!. 
Enter in your letter character that you want to use"
    until ("a".."z").include?(variable_icon = gets.chomp) || ("A".."Z").include?(variable_icon) && variable_icon.length == 1 do
        puts "You put a invalid character. Enter a single letter character" 
    end     

    array.push(Players.new(variable_icon))
    
end
    
def player_generators(array)

2.times do
    icon_check(array)
end
end

def board_display(array, board)

    player = board.board.count(array[1].player_icon) >= board.board.count(array[0].player_icon) ? 0 : 1;
    puts "It's your turn player  #{player}. Enter a number on the board to place your symbol
     #{board.board[1]} | #{board.board[2]} | #{board.board[3]}
    -----------
     #{board.board[4]} | #{board.board[5]} | #{board.board[6]}
    -----------
     #{board.board[7]} | #{board.board[8]} | #{board.board[9]}"
    return player
end

def turn(array,board) 
 
    until((1..9).include?(board.board[position = gets.chomp.to_i]) && board.board[position].class != String)
        puts 'position is not available. Choose a open position on the board'
    end 
 
        if (board.board.count(array[1].player_icon) >= board.board.count(array[0].player_icon))
        board.player_move(array[0].player_icon, position.to_i)
    else 
        board.player_move(array[1].player_icon, position.to_i)
    end

end
def rerun(result)
    puts "You won player#{result}! enter Y to play again or enter any other character to exit"
 
    if (gets.chomp == "Y")
    game()
    else
        puts "Thank you for playing!"
     
    end
    
end

def game
 
    array =[]
    board = GameBoard.new([0,1,2,3,4,5,6,7,8,9])
    player_generators(array) 

    until (board.win(board.board,array[0].player_icon) || board.win(board.board,array[1].player_icon))   
     result =    board_display(array, board)
        turn(array, board)
    end
    rerun(result)
end

game()


