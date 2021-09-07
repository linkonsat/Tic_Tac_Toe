require 'pry-byebug'

class Players
    attr_accessor :player_icon

    def initialize (player_icon)
        @player_icon = player_icon
    end

  
end

 class GameBoard
    #includes initial gameboard and win checks
    attr_accessor :board
    def initialize(board)
    @board = board 
    end
    def win_check_columns(board,player_symbol)
       if board[0,3].include?(player_symbol)

       end
    end

    def win_check_rows

    end

    def win_check_diagonals

    end

    def player_move (player_symbol,position)

        board[position] = player_symbol

    end
end


array =[]

    

def icon_check(array)
   # binding.pry
puts "Welcome to Tic Tac Toe player #{array.length}!. 
Enter in your letter character that you want to use"
    until ("a".."z").include?(variable_icon = gets.chomp) || ("A".."Z").include?(variable_icon) && variable_icon.length == 1 do
        puts "You put a invalid character. Enter a single letter character" 
    end     

    array.push(Players.new(variable_icon))
    
end
    board = GameBoard.new([0,1,2,
        3,4,5,
        6,7,8,
       ])

2.times do
    icon_check(array)
end

def board_display(board)
    puts "It's your turn player 0. Enter a number on the board to place your symbol
     #{board.board[0]} | #{board.board[1]} | #{board.board[2]}
    -----------
     #{board.board[3]} | #{board.board[4]} | #{board.board[5]}
    -----------
    #{board.board[6]} | #{board.board[7]} | #{board.board[8]}"
end

def turn_check(array,board) 
    
    until((0..8).include?(board.board[position = gets.chomp.to_i]) && board.board[position].class != String)
        puts 'position is not available. Choose a open position on the board'
    end 
    #binding.pry
        if (board.board.count(array[1].player_icon) >= board.board.count(array[0].player_icon))
        board_display(board)
        board.player_move(array[0].player_icon, position.to_i)
    else 
        board_display(board)
        board.player_move(array[1].player_icon, position.to_i)
    end

end
   
    8.times do
        board_display(board)
        turn_check(array, board)
    end
#count board display and if board isplay is even start with player 0 else start with player 1
