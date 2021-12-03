# frozen_string_literal: true

class Game
  include Colors
  attr_accessor :board, :codebreaker, :mastermind

  @@round_count = 1

  def self.round_count
    @@round_count
  end
  
  def initialize
    @board = Board.new
    @codebreaker = Codebreaker.new
    @mastermind = Mastermind.new
  end
  
  def play
    mastermind.generate_code
    prep_board
    round
    # Repeat the last two steps above until codebreaker gets the sequence right within 12 turns
    # If codebreaker can't get it right within 12 turns, mastermind wins and reveals the code.
    game_end
  end

  def prep_board
    board.secret_pegs = mastermind.hide_secret_code
    board.show_board
  end

  def round
    codebreaker_turn
    board.show_board
    mastermind_turn
    board.show_board
    if mastermind.secret_code == to_coloredpegs(codebreaker.guess) || @@round_count == 12
      puts "You win!"
      return
    end
    @@round_count += 1
    round
  end

  def codebreaker_turn
    codebreaker.guess = to_coloredpegs(gets.chomp.scan(/\w+/))
    board.current_row = codebreaker.guess + ['|'] + board.empty_pegs
  end

  def mastermind_turn
    board.current_row = codebreaker.guess + ['|'] + to_coloredpegs(feedback)
  end

  def feedback
    feedback_ary = ['_ ', '_ ', '_ ', '_ ']
    for i in 0..3
      if codebreaker.guess.include?(mastermind.secret_code[i])
        if mastermind.secret_code[i] == codebreaker.guess[i]
          feedback_ary[i] = "R"
          next
        end
        feedback_ary[i] = "W"
      end
    end
    feedback_ary.shuffle.sort # array, letters, not converted yet
  end

  def game_end
  end

end


# codebreaker wins if mastermind.secret_code == to_coloredpegs(codebreaker.guess)