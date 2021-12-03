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
    codebreaker.guess = to_coloredpegs(gets.chomp.scan(/\w+/))
    board.current_row = codebreaker.guess + ['|'] + board.empty_pegs
  end

  def mastermind_turn
    # Check mastermind's secret code against codebreaker's guess.
    give_feedback
    # Update the key pegs of the current row.

  end

  def give_feedback
   p code = mastermind.secret_code
   p guess = codebreaker.guess
    feedback = ['_','_','_', '_']
    for i in 0..3
      if guess.include?(code[i])
        if code[i] == guess[i]
          feedback[i] = "R"
          next
        end
        feedback[i] = "W"
      end
    end
    p feedback.shuffle.sort
  end

end


# codebreaker wins if mastermind.secret_code == to_coloredpegs(codebreaker.guess)