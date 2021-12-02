# frozen_string_literal: true

class Board
  attr_accessor :input

  def initialize(code_pegs = empty_code_pegs)
    @code_pegs = code_pegs
  end

  def empty_code_pegs
    Array.new(4, '_')
  end

  def display_mastermind_pegs
    empty_code_pegs.join(' ')
  end

  def empty_key_pegs
    Array.new(4, '_')
  end

  def create_empty_row
    empty_code_pegs.push(" | ").concat(empty_key_pegs) # array
  end

  def create_modified_row
  end

  def display_row(row)
    row.join(" ") # string. what if i wanna display modified row?
  end

  def display_board(row)
    <<-ALLPEGS
                      #{display_mastermind_pegs}

                      #{display_row(row)}
                      #{display_row(row)}
                      #{display_row(row)}
                      #{display_row(row)}
                      #{display_row(row)}
                      #{display_row(row)}
                      #{display_row(row)}
                      #{display_row(row)}
                      #{display_row(row)}
                      #{display_row(row)}
                      #{display_row(row)}
                      #{display_row(row)}
    ALLPEGS
  end

  def display_clear_board
    display_board(create_empty_row)
  end

end

puts Board.new.display_first_board