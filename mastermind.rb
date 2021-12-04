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
    secret_code.map {|peg| "? " }.join(" ")
  end

  def decide_secret_code
    puts "\nDecide your secret code. (R=🔴, O=🟠, Y=🟡, G=🟢, Bl=🔵, P=🟣, Br=🟤, W=⚪)"
    i = 0
    loop do
      self.secret_code = to_coloredpegs(gets.chomp.upcase.scan(/\w+/))
      if secret_code.uniq.length != 4
        system('tput cuu1 && tput el')
        print "Invalid entry. Please try again. "
        i += 1
      else break
      end
    end
    if i > 0
      system('tput cup 2 0 && tput dch 33')
    end
    secret_code.join(" ")
  end

end

