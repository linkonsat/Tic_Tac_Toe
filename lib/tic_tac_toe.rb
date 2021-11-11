# frozen_string_literal: true

require 'pry-byebug'
require_relative './Game_Rules'
require_relative './players'


def game
  players = []
  board = GameBoard.new(['a', 1, 2, 3, 4, 5, 6, 7, 8, 9])
  player_generators(players)

  until board.win(board.board, players[0].player_icon) || board.win(board.board, players[1].player_icon) || board.tie(board.board)
    result = board_display(players, board)
    turn(players, board)
  end
  rerun(result, board)
end


