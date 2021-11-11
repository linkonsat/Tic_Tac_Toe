class GameBoard
    attr_accessor :board
  
    include GameRules
    def initialize(board)
      @board = board
    end
  
    def player_move(player_symbol, position)
      board[position] = player_symbol
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