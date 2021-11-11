# frozen_string_literal: true

require 'pry-byebug'
require './lib/Game_Rules'

# creates a player
class Players
  attr_accessor :player_icon

  def initialize(player_icon)
    @player_icon = player_icon
  end
end

# allows the board to be changed
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

def icon_check(array)
  # binding.pry
  puts "Welcome to Tic Tac Toe player #{array.length}!.
Enter in your letter character that you want to use"

  until ('a'..'z').include?(player_icon = gets.chomp) || ('A'..'Z').include?(player_icon) && player_icon.length == 1
    puts 'You put a invalid character. Enter a single letter character'
  end

  array.push(Players.new(player_icon))
end

def player_generators(array)
  2.times do
    icon_check(array)
  end
end

def board_display(array, board)
  player = board.board.count(array[1].player_icon) >= board.board.count(array[0].player_icon) ? 0 : 1
  puts "It's your turn player  #{player}. Enter a number on the board to place your symbol
     #{board.board[1]} | #{board.board[2]} | #{board.board[3]}
    -----------
     #{board.board[4]} | #{board.board[5]} | #{board.board[6]}
    -----------
     #{board.board[7]} | #{board.board[8]} | #{board.board[9]}"
  player
end

def turn(players, board)
  until (1..9).include?(board.board[position = gets.chomp.to_i]) && board.board[position].class != String
    puts 'position is not available. Choose a open position on the board'
  end

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

game
