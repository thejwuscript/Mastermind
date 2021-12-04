# frozen_string_literal: true

class Game
  include Colors
  attr_accessor :board, :codebreaker, :mastermind

  @@round_count = 1
  @@index_array = [0,1,2,3]
  @@colors_to_choose = []
  @@filtered_array = COLORED_PEGS.map { |color| color }


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
    board.current_row = codebreaker.guess + ['|'] + to_coloredpegs(feedback.shuffle.sort)
  end

  def feedback
    feedback_ary = ['_ ', '_ ', '_ ', '_ ']
    for i in 0..3
      if mastermind.secret_code.include?(codebreaker.guess[i])
        if mastermind.secret_code[i] == codebreaker.guess[i]
          feedback_ary[i] = "R"
          next
        end
        feedback_ary[i] = "W"
      end
    end
    if codebreaker.name == 'Player'
      feedback_ary.shuffle.sort
    else feedback_ary
    end
  end

  def game_end
    board.secret_pegs = mastermind.secret_code.join(" ")
    board.show_board
    if mastermind.secret_code == codebreaker.guess && codebreaker.name == "Player"
      puts "Congratulations, you win!"
    elsif @@round_count == 12 && mastermind.name == "Player"
      puts "Congratulations, you win!"
    else
      puts "Oh no, computer wins."
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
    if @@round_count == 1
      codebreaker.guess = COLORED_PEGS.sample(4)
      return
    end
    3.downto(0) do |i|
      print "Computer thinking...#{i} \r"
      sleep 1
    end
    match_reds
    match_length
    assign_unique_color
    reset_values
  end

  def match_reds
    for i in 0..3
      if feedback[i] == "R"
        @@index_array.delete(i)
        @@filtered_array.delete(codebreaker.guess[i])
      elsif feedback[i] == '_ '
        @@filtered_array.delete(codebreaker.guess[i])
      elsif feedback[i] == "W"
        @@colors_to_choose.push(codebreaker.guess[i])
      end
    end
  end

  def match_length
    until @@index_array.length == @@colors_to_choose.length do
      new_array = @@filtered_array - @@colors_to_choose
      @@colors_to_choose.push(new_array.sample)
    end
  end

  def assign_unique_color
    @@index_array.each do |num|
      codebreaker.guess[num] = @@colors_to_choose.sample
      @@colors_to_choose.delete(codebreaker.guess[num])
    end
  end

  def reset_values
    @@index_array = [0,1,2,3]
    @@colors_to_choose = []
  end
end