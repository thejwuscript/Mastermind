# frozen_string_literal: true

class Game
  include Colors
  attr_accessor :board, :codebreaker, :mastermind
  
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
    #round
    # Repeat the last two steps above until codebreaker gets the sequence right within 12 turns
    # If codebreaker can't get it right within 12 turns, mastermind wins and reveals the code.
  end

  def prep_board
    board.secret_pegs = mastermind.hide_secret_code
    board.show_board
  end

  def round
    codebreaker_turn
  end

  def codebreaker_turn
    # Codebreaker chooses 4 colors as their guess and store it in @guess.
    codebreaker.guess = gets.chomp.scan(/\w+/)
    # Convert letters to color pegs
    codebreaker.guess
    # Find the correct row

    # Place in the correct row
  end

end