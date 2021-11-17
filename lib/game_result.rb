require 'pry-byebug'
class GameResult
    def win(board, player_icon)
      winning_condition = [player_icon, player_icon, player_icon]
      board_condition = [board.values_at(0, 1, 2), board.values_at(3, 4, 5),
                         board.values_at(6, 7, 8), board.values_at(0, 3, 6),
                         board.values_at(1, 4, 7), board.values_at(2, 5, 8),
                         board.values_at(0, 4, 8), board.values_at(2, 4, 6)]
     if (board_condition.include?(winning_condition))
      return true
     end  
    end
  
    def tie(board)
     if (board.any?(Numeric) == false )
      return true
     end
    end
  end
  