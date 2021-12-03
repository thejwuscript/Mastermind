# frozen_string_literal: true
require_relative 'colors.rb'

class Board
  
  include Colors

  attr_accessor :secret_pegs, :guess_pegs, :key_pegs, :row

  def initialize
    @secret_pegs = nil
    @guess_pegs = empty_pegs
    @key_pegs = empty_pegs
    @row = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12].map { display_empty_row }
  end

  def current_row
    @row[Game::ROUND_COUNT-1]
  end

  def current_row=(value)
    @row[Game::ROUND_COUNT-1] = value.join(" ")
  end

  def empty_pegs
    Array.new(4, '_ ')
  end

  def empty_row
    empty_pegs.push("|").concat(empty_pegs) # array
  end

  def display_empty_row
    empty_row.join(" ") # string
  end

  def update_row(number)
    row[number] = "#{guess_pegs} | #{key_pegs}"
  end

  def show_board
    puts <<-ALLPEGS

      Secret code --> #{secret_pegs}

                      #{row[11]}
                      #{row[10]}
                      #{row[9]}
                      #{row[8]}
                      #{row[7]}
                      #{row[6]}
                      #{row[5]}
                      #{row[4]}
                      #{row[3]}
                      #{row[2]}
                      #{row[1]}
      START HERE -->  #{row[0]}

    ALLPEGS
  end
end