# frozen_string_literal: true

class Game
  include Colors
  attr_accessor :board, :codebreaker, :mastermind
  
  def initialize
    @board = Board.new
    @codebreaker = Codebreaker.new
    @mastermind = Mastermind.new
  end
  
  def prep_board
    code = mastermind.hide_secret_code
    empty_row = board.display_empty_row
    board.show_board(empty_row, code)
  end

  def play
    # Mastermind creates the secret code and stores it as an attribute.
    mastermind.generate_code
    #Hide the secret code and show the board.
    prep_board
   
    # Codebreaker chooses 4 colors and place them in the first row, to make their guess.
    # Mastermind provides feedback.
    # Repeat the last two steps above until codebreaker gets the sequence right within 12 turns
    # If codebreaker can't get it right within 12 turns, mastermind wins and reveals the code.

  end
end