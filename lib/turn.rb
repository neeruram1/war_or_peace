class Turn
attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if @player1.has_lost? == false && @player2.has_lost? == false

      if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0) || @player2.deck.rank_of_card_at(0) > @player1.deck.rank_of_card_at(0)
        :basic
      elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
        :mutually_assured_destruction
      elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
        :war
      else
        "No Winner"
    end
  else
    "No Winner"
  end
  end

  def winner
    if @player1.has_lost? == false && @player2.has_lost? == false

      if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
        @player1
      elsif @player2.deck.rank_of_card_at(0) > @player1.deck.rank_of_card_at(0)
        @player2
      elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
        "No Winner"
      elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
        @player1
      elsif
        @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player2.deck.rank_of_card_at(2) > @player1.deck.rank_of_card_at(2)
        @player2
    end
  else
    "No Winner"
  end
  end

  def pile_cards
    if @player1.has_lost? == false && @player2.has_lost? == false

      if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0) || @player2.deck.rank_of_card_at(0) > @player1.deck.rank_of_card_at(0)
        @spoils_of_war << @player1.deck.remove_card
        @spoils_of_war << @player2.deck.remove_card
      elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
        @player1.deck.remove_card
        @player1.deck.remove_card
        @player1.deck.remove_card
        @player2.deck.remove_card
        @player2.deck.remove_card
        @player2.deck.remove_card
      elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
        @spoils_of_war << @player1.deck.remove_card
        @spoils_of_war << @player1.deck.remove_card
        @spoils_of_war << @player1.deck.remove_card
        @spoils_of_war << @player2.deck.remove_card
        @spoils_of_war << @player2.deck.remove_card
        @spoils_of_war << @player2.deck.remove_card
      end
    else
      @spoils_of_war << []
    end
  end

  def award_spoils(winner)
    if @player1.has_lost? == false && @player2.has_lost? == false

      if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0) || @player2.deck.rank_of_card_at(0) > @player1.deck.rank_of_card_at(0)
        winner.deck.add_card(@spoils_of_war)
      elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
        @player1.deck = @player1.deck
        @player2.deck = @player2.deck
      elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
          winner.deck.add_card(@spoils_of_war)
      else
        @player1.deck = @player1.deck
        @player2.deck = @player2.deck
    end
  else
    "No Winner"
  end
    @spoils_of_war = []

  end
end
