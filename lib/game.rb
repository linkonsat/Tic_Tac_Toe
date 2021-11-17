require_relative "./players"
require_relative "./gameboard"
require_relative "./game_result"
require "pry-byebug"
class Game
  attr_accessor :player_list, :board 

  def initialize
    @player_list = []
    @board = GameBoard.new
  end
    def create_players
        2.times do
        @player_list.push(Players.new)
      end
    end

    def assign_player_symbols 
      i = 0
      2.times do 
        puts "Welcome to Tic Tac Toe player #{i}!.\n
        Enter in your letter character that you want to use"
        @player_list[i].assign_player 
        i += 1
      end
    end
    def player_turn
    return player = @board.board.count(@player_list[1].player_icon) >= @board.board.count(@player_list[0].player_icon) ? 0 : 1
    end

    def run_game
      self.create_players
      self.assign_player_symbols
      win_conditions = GameResult.new
      next_player = @player_list[player_turn]
      previous_player = @player_list[player_turn - 1]
      until win_conditions.win(@board.board,previous_player.player_icon) || win_conditions.tie(@board.board)
        @board.board_display(next_player,@board)
        position = @board.player_move
        @board.change_board(position,next_player.player_icon)
         next_player = @player_list[player_turn]
         previous_player = @player_list[player_turn - 1]
      end
      self.rerun(previous_player,@board)
    end
    
    def rerun(player, board)
      win_conditions = GameResult.new
      if win_conditions.tie(board.board) == true
        puts "It's a tie :(. enter Y to play again or enter any other character to exit"
      else
        puts "You won player #{player.player_icon}! enter Y to play again or enter any other character to exit"
      end
    
      if gets.chomp == 'Y'
        @board = GameBoard.new
        @player_list = []
        run_game
      else
        puts 'Thank you for playing!'
    
      end
    end
end