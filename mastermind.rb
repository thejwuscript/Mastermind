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
    self.secret_code = to_coloredpegs(colors.sample(4)) #array
  end

  def hide_secret_code
    secret_code.split.map {|peg| "?" }.join(" ")
  end
end

