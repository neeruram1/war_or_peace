require './lib/card'
require './lib/deck.rb'
require './lib/player.rb'
require './lib/turn.rb'
require './lib/game_functionality.rb'
require 'pry'

game = GameFunctionality.new
game.add_cards_starter_deck
game.split_deck
game.shuffle_deck
game.add_players
game.start
