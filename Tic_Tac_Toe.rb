require 'pry-byebug'

module GAMERULES 
    
    def win (board,player_symbol)
        
        winning_conditions = [
            [player_symbol, player_symbol, player_symbol,
            3,4,5,
            6,7,8
            ],
            [0,1,2,
            player_symbol,player_symbol,player_symbol,
            6,7,8],
            [0,1,2,
            3,4,5,
            player_symbol,player_symbol,player_symbol
            ],
            [player_symbol,1,2,
            player_symbol,4,5,
            player_symbol,7,8],
            [0,player_symbol,2,
            3,player_symbol,5,
            6,player_symbol,8],
            [0,1,player_symbol,
            3,4,player_symbol,
            6,7,player_symbol],
            [player_symbol,1,2,
            3,player_symbol, 5,
            6,7,player_symbol],
            [0,1,player_symbol,
            3,player_symbol,5,
            player_symbol,7,8]

        ]
         if (winning_conditions.any?(board))
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
    include GAMERULES
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
    #basically first sets up a loop. The loop in this case calls a method that pushes a new object 
    #with a player icon onto a array
2.times do
    icon_check(array)
end
end

def board_display(board)
    #simply puts out a board of the board state
    puts "It's your turn player 0. Enter a number on the board to place your symbol
     #{board.board[0]} | #{board.board[1]} | #{board.board[2]}
    -----------
     #{board.board[3]} | #{board.board[4]} | #{board.board[5]}
    -----------
    #{board.board[6]} | #{board.board[7]} | #{board.board[8]}"
end

def turn(array,board) 
    #RIght. so essentially what this method does is switch between players and creates
    # a new filled position on the board based ont he input
    until((0..8).include?(board.board[position = gets.chomp.to_i]) && board.board[position].class != String)
        puts 'position is not available. Choose a open position on the board'
    end 
    #binding.pry
        if (board.board.count(array[1].player_icon) >= board.board.count(array[0].player_icon))
        board.player_move(array[0].player_icon, position.to_i)
    else 
        board.player_move(array[1].player_icon, position.to_i)
    end

end
def rerun
    puts "enter Yes to play again"
   # binding.pry
    if (gets.chomp == "Yes")
    game()
    else
        puts "Thank you for playing!"
        #binding.pry
    end
    
end
#we
def game
    #this should be a game function which runs the game. it DOES NOT CLEAR AND START THE NEW ONE
    #why board.length? we know the game has to a run a minimum of the number of cells
    array =[]
    board = GameBoard.new([0,1,2,3,4,5,6,7,8,])
    player_generators(array) 
    #   binding.pry
    until (board.win(board.board,array[0].player_icon) || board.win(board.board,array[1].player_icon))   
        board_display(board)
        turn(array, board)
    end
    rerun()
end

game()

#count board display and if board isplay is even start with player 0 else start with player 1

