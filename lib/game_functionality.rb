require 'pry'
class GameFunctionality
  attr_reader :starter_deck,
              :deck1,
              :deck2,
              :player1,
              :player2

  def initialize(initial_deck = [])
    @starter_deck = initial_deck
    @deck1 = []
    @deck2 = []
  end

  def add_cards_starter_deck
    @starter_deck << [card1 = Card.new(:heart, '2', 2), #index0
    card2 = Card.new(:heart, '3', 3),
    card3 = Card.new(:heart, '4', 5), #index2
    card4 = Card.new(:heart, '5', 5), #index3
    card5 = Card.new(:heart, '6', 6),
    card6 = Card.new(:heart, '7', 7),
    card7 = Card.new(:heart, '8', 8),
    card8 = Card.new(:heart, '9', 9),
    card9 = Card.new(:heart, '10', 10),
    card10 = Card.new(:heart, 'Jack', 11),
    card11 = Card.new(:heart, 'Queen', 12),
    card12 = Card.new(:heart, 'King', 13),
    card13 = Card.new(:heart, 'Ace', 14),
    card14 = Card.new(:club, '2', 2),
    card15 = Card.new(:club, '3', 2),
    card16 = Card.new(:club, '4', 2),
    card17 = Card.new(:club, '5', 5),
    card18 = Card.new(:club, '6', 6),
    card19 = Card.new(:club, '7', 7),
    card20 = Card.new(:club, '8', 8),
    card21 = Card.new(:club, '9', 9),
    card22 = Card.new(:club, '10', 10),
    card23 = Card.new(:club, 'Jack', 11),
    card24 = Card.new(:club, 'Queen', 12),
    card25 = Card.new(:club, 'King', 13),
    card26 = Card.new(:club, 'Ace', 14),
    #this is where the deck is split
    card27 = Card.new(:diamond, '2', 3), #index0
    card28 = Card.new(:diamond, '3', 2),
    card29 = Card.new(:diamond, '4', 4), #index2
    card30 = Card.new(:diamond, '5', 5), #index3
    card31 = Card.new(:diamond, '6', 6),
    card32 = Card.new(:diamond, '7', 7),
    card33 = Card.new(:diamond, '8', 8),
    card34 = Card.new(:diamond, '9', 9),
    card35 = Card.new(:diamond, '10', 10),
    card36 = Card.new(:diamond, 'Jack', 11),
    card37 = Card.new(:diamond, 'Queen', 12),
    card38 = Card.new(:diamond, 'King', 13),
    card39 = Card.new(:diamond, 'Ace', 14),
    card40 = Card.new(:spade, '2', 2),
    card41 = Card.new(:spade, '3', 3),
    card42 = Card.new(:spade, '4', 4),
    card43 = Card.new(:spade, '5', 5),
    card44 = Card.new(:spade, '6', 6),
    card45 = Card.new(:spade, '7', 7),
    card46 = Card.new(:spade, '8', 8),
    card47 = Card.new(:spade, '9', 9),
    card48 = Card.new(:spade, '10', 10),
    card49 = Card.new(:spade, 'Jack', 11),
    card50 = Card.new(:spade, 'Queen', 12),
    card51 = Card.new(:spade, 'King', 13),
    card52 = Card.new(:spade, 'Ace', 14)]
    @starter_deck = @starter_deck.flatten
  end

  def split_deck
    @deck1 = Deck.new(@starter_deck[0..25])
    @deck2 = Deck.new(@starter_deck[26..51])
  end

  def shuffle_deck
    @deck1.cards.shuffle!
    @deck2.cards.shuffle!
  end

  def add_players
    @player1 = Player.new('Megan', @deck1)
    @player2 = Player.new('Aurora', @deck2)
  end

  def start
    turn = Turn.new(@player1, @player2)
    p "Welcome to War! (or Peace) This game will be played with 52 cards."
    p "The players today are #{@player1.name} and #{@player2.name}."
    p "Type 'GO' to start the game!"
    p "-----------------------------------------------"

    gets.chomp

    count = 0

    until @player1.has_lost? || @player2.has_lost? || count == 1000000
      count += 1
      turn.type
      winner = turn.winner

        if turn.type == :mutually_assured_destruction
          p "Turn #{count}: **mutually assured destruction** 6 cards removed from play"
        elsif turn.type == :war
          p "Turn #{count}: WAR - #{winner.name} won 6 cards"
        else turn.type == :basic
          p "Turn #{count}: #{winner.name} won 2 cards"
        end

        turn.pile_cards
        turn.award_spoils(winner)

        if @player1.has_lost?
          p "*~*~ #{@player2.name} has won the game!!!!! *~*~"
        elsif @player2.has_lost?
          p "*~*~ #{@player1.name} has won the game!!!!! *~*~"
        end
      end
      p "------DRAW-------"

    end
  end
