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

  def test_it_has_initial_empty_deck
    game = GameFunctionality.new

    assert_equal [], game.starter_deck
  end

  def test_it_has_a_52_card_deck
    game = GameFunctionality.new
    game.add_cards_starter_deck

    assert_equal 52, game.starter_deck.count
  end

  def test_it_can_split_deck_into_two_new_decks
    game = GameFunctionality.new
    game.add_cards_starter_deck
    game.split_deck

    assert_equal game.starter_deck[0..25], game.deck1.cards
    assert_equal game.starter_deck[26..52], game.deck2.cards
  end

  def test_each_deck_has_26_cards
    game = GameFunctionality.new
    game.add_cards_starter_deck
    game.split_deck

    assert_equal 26, game.deck1.cards.count
    assert_equal 26, game.deck2.cards.count
  end

  def test_deck_is_instance_of_deck_class
    game = GameFunctionality.new
    game.add_cards_starter_deck
    game.split_deck

    assert_equal Deck, game.deck1.class
  end

  def test_it_can_shuffle_decks
    game = GameFunctionality.new
    game.add_cards_starter_deck
    game.split_deck
    game.shuffle_deck

    refute_equal game.deck1.cards, game.starter_deck[0..25]
  end

  def test_it_has_players
    game = GameFunctionality.new
    game.add_cards_starter_deck
    game.split_deck
    game.shuffle_deck
    game.add_players

    assert_equal "Megan", game.player1.name
    assert_equal "Aurora", game.player2.name
  end

  def test_player_has_deck
    game = GameFunctionality.new
    game.add_cards_starter_deck
    game.split_deck
    game.shuffle_deck
    game.add_players

    assert_equal game.deck1, game.player1.deck
  end

  def test_player_deck_is_not_empty
    game = GameFunctionality.new
    game.add_cards_starter_deck
    game.split_deck
    game.shuffle_deck
    game.add_players

    assert_equal false, game.player1.deck.cards.empty?
  end
end
