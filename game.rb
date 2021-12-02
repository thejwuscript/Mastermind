# frozen_string_literal: true

class Game
  attr_accessor :board, :codebreaker, :mastermind
  
  def initialize
    @board = Board.new
    @codebreaker = Codebreaker.new
    @mastermind = Mastermind.new
  end
  
  def play
    # first display the board. 
    # Mastermind creates the secret code and puts it on the board. MUST HIDE THEM.
    # Codebreaker chooses 4 colors and place them in the first row, to make their guess.
    # Mastermind provides feedback.
    # Repeat the last two steps above until codebreaker gets the sequence right within 12 turns
    # If codebreaker can't get it right within 12 turns, mastermind wins and reveals the code.

  end

end