# frozen_string_literal: true

class Mastermind
  include Colors
  attr_accessor :name, :colors, :secret_code

  def initialize
    @name = "Mastermind"
    @colors = LETTER_OF_COLORS
    @secret_code = nil
  end

  def generate_code
    colors.sample(4) #array
  end
end

