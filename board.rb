# frozen_string_literal: true
require_relative 'colors.rb'

class Board
  
  include Colors

  attr_accessor :code_pegs

  def initialize(code_pegs = empty_code_pegs)
    @code_pegs = code_pegs
  end

  def empty_code_pegs
    Array.new(4, '_')
  end

  def empty_key_pegs
    Array.new(4, '_')
  end

  def create_empty_row
    empty_code_pegs.push(" | ").concat(empty_key_pegs) # array
  end

  def create_modified_row
  end

  def display_empty_row
    create_empty_row.join(" ") # string
  end

  #def show_clear_board
  #  show_board(display_empty_row)
  #end

  def show_board(row, code)
    puts <<-ALLPEGS

      Secret code --> #{code}

                      #{row}
                      #{row}
                      #{row}
                      #{row}
                      #{row}
                      #{row}
                      #{row}
                      #{row}
                      #{row}
                      #{row}
                      #{row}
      START HERE -->  #{row}

    ALLPEGS
  end


end
