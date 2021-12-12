# frozen_string_literal: true

# 🔴🟠🟡🟢🔵🟣🟤⚪

require_relative 'board'
require_relative 'codebreaker'
require_relative 'colors'
require_relative 'mastermind'
require_relative 'game'

def loading
  print 'Loading game'
  2.times do
    sleep 0.5
    print '.'
  end
  4.times do
    sleep 0.05
    print '.'
  end
  2.times do
    sleep 0.5
    print '.'
  end
  3.times do
    sleep 0.04
    print '.'
  end
  3.times do
    sleep 0.7
    print '.'
  end
  15.times do
    sleep 0.04
    print '.'
  end
end

system('clear')
puts 'Welcome to Mastermind. You will play against the computer.'
puts "Enter the number '1' or '2' to choose your side. (1 = Codebreaker, 2 = Mastermind)"
game = Game.new
loop do
  case gets.chomp.to_i
  when 1
    puts "You are Codebreaker. Let's begin."
    loading
    game.play_as_1
    break
  when 2
    puts "You are Mastermind. Let's begin."
    loading
    game.play_as_2
    break
  else
    puts 'Invalid entry. Please try again.'
  end
end
