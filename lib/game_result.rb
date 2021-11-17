# Module compares board values and returns true is board match exists
class GameResult
    def win(board, player_symbol)
      winning_condition = [player_symbol, player_symbol, player_symbol]
  
      board_condition = [board.values_at(0, 1, 2), board.values_at(3, 4, 5),
                         board.values_at(6, 7, 8), board.values_at(0, 3, 6),
                         board.values_at(1, 4, 7), board.values_at(2, 5, 8),
                         board.values_at(0, 4, 8), board.values_at(2, 4, 6)]
      return true if board_condition.include?(winning_condition)
    end
  
    def tie(board)
      true if board.any?(Numeric) == false 
    end
  end
  