class GameBoard
    attr_accessor :board, :position

    def initialize(board)
      @board = board 
      @position = nil
    end
  
    def player_move
        until (1..7).include?(@position = verify_input(position = gets.chomp.to_i)) 
            puts "position is not available. Choose a open position on the board"
        end
    end
    
    def change_board(position,player_symbol)    
        @board[position] = player_symbol
    end
    private
        def verify_input(position)
            if (1..7).include?(position)
                return position
            end
        end

  def board_display(player, board)
    puts "It's your turn player  #{player}. Enter a number on the board to place your symbol
       #{board.board[1]} | #{board.board[2]} | #{board.board[3]}
      -----------
       #{board.board[4]} | #{board.board[5]} | #{board.board[6]}
      -----------
       #{board.board[7]} | #{board.board[8]} | #{board.board[9]}"
  end
  end

