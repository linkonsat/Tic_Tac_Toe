class GameBoard
    attr_accessor :board, :position

    def initialize(board = [0,1,2,3,4,5,6,7,8,9])
      @board = board 
      @position = nil
    end
  
    def player_move
        until (0..8).include?(@position = verify_input(position = gets.chomp.to_i)) 
            puts "position is not available. Choose a open position on the board"
        end
        return position
    end
    
    def change_board(position,player_symbol)    
        @board[position] = player_symbol
    end

    def board_display(player, board)
        puts "It's your turn player  #{player.player_icon}. Enter a number on the board to place your symbol
           #{board.board[0]} | #{board.board[1]} | #{board.board[2]}
          -----------
           #{board.board[3]} | #{board.board[4]} | #{board.board[5]}
          -----------
           #{board.board[6]} | #{board.board[7]} | #{board.board[8]}"
      end

    private
        def verify_input(position)
            if (0..8).include?(position)
                return position
            end
        end

  end

