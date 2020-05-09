require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'
require './lib/game_functionality'
require 'pry'

class GameFunctionalityTest < Minitest::Test
  def test_it_exists
    game = GameFunctionality.new
    assert_instance_of GameFunctionality, game
  end

  def test_it_has_a_52_card_deck
    game = GameFunctionality.new


    assert_equal 52, game.deck.count
  end
end
