# Module compares board values and returns true is board match exists
module GameRules
    def win(board, player_symbol)
      winning_condition = [player_symbol, player_symbol, player_symbol]
  
      board_condition = [board.values_at(1, 2, 3), board.values_at(4, 5, 6),
                         board.values_at(7, 8, 9), board.values_at(1, 4, 7),
                         board.values_at(2, 5, 8), board.values_at(3, 6, 9),
                         board.values_at(1, 5, 9), board.values_at(3, 5, 7)]
      return true if board_condition.include?(winning_condition)
    end
  
    def tie(board)
      true if board.any?(Numeric) == false
    end
  end
  