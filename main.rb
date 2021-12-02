# frozen_string_literal: true
# Build a Mastermind game from the command line where you have 12 turns to guess the secret code,
# starting with you guessing the computer’s random code.
#
# Assume the computer randomly selects the secret colors and the human player must guess them.
#"🔴🟠🟡🟢🔵🟣🟤⚪"
# puts 

require_relative 'board.rb'
require_relative 'codebreaker.rb'
require_relative 'colors.rb'
require_relative 'mastermind.rb'
require_relative 'game.rb'

puts "Let's play Mastermind."
puts "AI will be the Mastermind. You will be the Codebreaker."

game = Game.new
game.play