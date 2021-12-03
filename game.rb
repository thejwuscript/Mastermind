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
  
  def play_as_1
    codebreaker.name = "Player"
    mastermind.name = "Computer"
    mastermind.generate_code
    prep_board
    round
    game_end
  end

  def prep_board
    board.secret_pegs = mastermind.hide_secret_code
    board.show_board
  end

  def round
    codebreaker.name == "Player" ? codebreaker_turn : aicodebreaker_turn
    mastermind_turn
    if mastermind.secret_code == codebreaker.guess || @@round_count == 12
      return
    end
    board.show_board
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
    feedback_ary.shuffle.sort
  end

  def game_end
    board.secret_pegs = mastermind.secret_code.join(" ")
    board.show_board
    if mastermind.secret_code == codebreaker.guess && codebreaker.name == "Player"
      puts "Congratulations, you win!"
    elsif @@round_count == 12 && mastermind.name == "Player"
      puts "Congratulations, you win!"
    else
      puts "Oh no, you didn't get the secret code."
    end
  end

  def play_as_2
    codebreaker.name = "Computer"
    mastermind.name = "Player"
    board.secret_pegs = mastermind.decide_secret_code
    board.show_board
    round
    game_end
  end

  def aicodebreaker_turn
    # Take 4 samples of the color pegs array. Make sure it in color circles.
    codebreaker.guess = COLORED_PEGS.sample(4)
    # Store AI's guues in codebreaker.guess as an array
  end


end


# codebreaker wins if mastermind.secret_code == to_coloredpegs(codebreaker.guess)