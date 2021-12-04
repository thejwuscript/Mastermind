# frozen_string_literal: true

# 🔴🟠🟡🟢🔵🟣🟤⚪

require_relative 'board.rb'
require_relative 'codebreaker.rb'
require_relative 'colors.rb'
require_relative 'mastermind.rb'
require_relative 'game.rb'

def loading
  print "Loading game"
  2.times do
    sleep 0.5; print '.'
  end
  4.times do
    sleep 0.05; print ".";
  end
  2.times do
    sleep 0.5; print '.'
  end
  3.times do
    sleep 0.04; print '.'
  end
  3.times do
    sleep 0.7; print '.'
  end
  15.times do
    sleep 0.04; print '.'
  end
end

system('clear')
puts 'Welcome to Mastermind. You will play against the computer.'
puts "Enter '1' or '2' to choose your side. (1 = Codebreaker, 2 = Mastermind)"
game = Game.new
if gets.chomp.to_i == 1
  puts "You chose Codebreaker. Let's begin."
  loading
  game.play_as_1
else 
  puts "You chose Mastermind. Let's begin."
  loading
  game.play_as_2
end

