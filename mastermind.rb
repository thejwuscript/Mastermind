# frozen_string_literal: true

class Mastermind
  include Colors

  attr_accessor :name, :colors, :secret_code

  def initialize
    @name = nil
    @colors = LETTERS
    @secret_code = nil
  end

  def generate_code
    self.secret_code = to_coloredpegs(colors.sample(4))
  end

  def hide_secret_code
    secret_code.map {|peg| "?" }.join(" ")
  end

  def decide_secret_code
    puts "Decide your secret code."
    self.secret_code = to_coloredpegs(gets.chomp.scan(/\w+/))  
  end


end

