# frozen_string_literal: true

class Game
  include Colors
  attr_accessor :board, :codebreaker, :mastermind

  ROUND_COUNT = 1
  
  def initialize
    @board = Board.new
    @codebreaker = Codebreaker.new
    @mastermind = Mastermind.new
  end
  


  def play
    # Mastermind creates the secret code and stores it as an attribute.
    mastermind.generate_code
    # Hide the code and show the board.
    prep_board
    # Codebreaker chooses 4 colors and place them in the first row, to make their guess.
    # Mastermind provides feedback.
    round
    # Repeat the last two steps above until codebreaker gets the sequence right within 12 turns
    # If codebreaker can't get it right within 12 turns, mastermind wins and reveals the code.
  end

  def prep_board
    board.secret_pegs = mastermind.hide_secret_code
    board.show_board
  end

  def round
    codebreaker_turn
    board.show_board
    mastermind_turn
  end

  def codebreaker_turn
    codebreaker.guess = gets.chomp.scan(/\w+/)
    guess_pegs = to_coloredpegs(codebreaker.guess)
    board.current_row = guess_pegs + ['|'] + board.empty_pegs
  end

  def mastermind_turn
    p mastermind.secret_code
    p codebreaker.guess
    #Check mastermind's secret code against codebreaker's guess.

    #Update the key pegs of the current row.
    
  end

end