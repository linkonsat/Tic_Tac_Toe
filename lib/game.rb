class Game

    def icon_check(array)
        # binding.pry
        puts "Welcome to Tic Tac Toe player #{array.length}!.
      Enter in your letter character that you want to use"
        array.push(Players.new(player_icon))
      end

      player
    end
    def player_turn(board)
    player = board.board.count(array[1].player_icon) >= board.board.count(array[0].player_icon) ? 0 : 1
    end
    def turn(players, board)
      position = board_input_verification(players,board)
      turn_switch(players,board,position)
    end
    def board_input_verification(players,board)
      until (1..9).include?(board.board[position = gets.chomp.to_i]) && board.board[position].class != String
        puts 'position is not available. Choose a open position on the board'
      end
      return position
    end
    
    def turn_switch(players,board,position)
      if board.board.count(players[1].player_icon) >= board.board.count(players[0].player_icon)
        board.player_move(players[0].player_icon, position.to_i)
      else
        board.player_move(players[1].player_icon, position.to_i)
      end
    end
    
    def rerun(result, board)
      if board.tie(board.board) == true
        puts "It's a tie :(. enter Y to play again or enter any other character to exit"
      else
        puts "You won player #{result}! enter Y to play again or enter any other character to exit"
      end
    
      if gets.chomp == 'Y'
        game
      else
        puts 'Thank you for playing!'
    
      end
    end
end