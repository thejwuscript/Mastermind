# frozen_string_literal: true

# 🔴🟠🟡🟢🔵🟣🟤⚪

require_relative 'board.rb'
require_relative 'codebreaker.rb'
require_relative 'colors.rb'
require_relative 'mastermind.rb'
require_relative 'game.rb'

puts 'Welcome to Mastermind. You will play against the computer.'
puts "Enter '1' or '2' to choose your side. (1 = Codebreaker, 2 = Mastermind)"
game = Game.new
if gets.chomp.to_i == 1
  puts "You chose Codebreaker."

  game.play_as_1
else 
  puts "You chose Mastermind."

  game.play_as_2
end

# Now refactor your code to allow the human player to choose whether they want to be the
# creator of the secret code or the guesser.