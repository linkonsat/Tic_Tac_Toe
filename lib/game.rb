require_relative "./players"
require_relative "./gameboard"
require_relative "./game_result"
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
        puts "Welcome to Tic Tac Toe player #{@player_list.length}!.\n
        Enter in your letter character that you want to use"
        @player_list[i].assign_player 
        i += 1
      end
    end
    def player_turn(board)
    return player = board.board.count(@player_list[0].player_icon) >= board.board.count(@player_list[1].player_icon) ? 0 : 1
    end

    def turn_switch(players,board,position)
      if board.board.count(players[1].player_icon) >= board.board.count(players[0].player_icon)
        board.player_move(players[0].player_icon, position.to_i)
      else
        board.player_move(players[1].player_icon, position.to_i)
      end
    end

    def run_game
      new_game = Game.new
      new_game.create_players
      new_game.assign_player_symbols
      win_conditions = GameResult.new
      current_player = player_list[0].player_icon
      until win_conditions.win(@board,current_player) || wind_conditions.tie(@board)
        @board.board_display(current_player,@board)
        position = @board.player_move
        @board.change_board(position,current_player.player_icon)
        current_player = new_game.player_turn(@board.board)
      end
      new_game.rerun(current_player,@board)
    end
    
    def rerun(player, board)
      if board.tie(board.board) == true
        puts "It's a tie :(. enter Y to play again or enter any other character to exit"
      else
        puts "You won player #{player.icon}! enter Y to play again or enter any other character to exit"
      end
    
      if gets.chomp == 'Y'
        run_game
      else
        puts 'Thank you for playing!'
    
      end
    end
end