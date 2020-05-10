class Turn
  attr_reader :player1,
              :player2,
              :spoils_of_war

  def initialize(player1_param, player2_param)
    @player1 = player1_param
    @player2 = player2_param
    @spoils_of_war = []
  end

  def type
    if @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
      :mutually_assured_destruction
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
      :war
    else @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
      :basic
    end
  end

  def winner
    if @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
      @player1
    elsif @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(0) < @player2.deck.rank_of_card_at(0)
      @player2
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
      @player1
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) < @player2.deck.rank_of_card_at(2)
      @player2
    else @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
      "No Winner"
    end
  end

  def pile_cards
    if @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
      3.times do
        @player1.deck.remove_card
      end
      3.times do
        @player2.deck.remove_card
      end

    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
      3.times do
        @spoils_of_war << @player1.deck.remove_card
      end
      3.times do
        @spoils_of_war << @player2.deck.remove_card
      end

    else @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
      @spoils_of_war << @player1.deck.remove_card
      @spoils_of_war << @player2.deck.remove_card
    end
  end

  def award_spoils(winner_param)
    if winner_param == "No Winner"
      @spoils_of_war = []
    else
      winner_param.deck.add_card(@spoils_of_war)
      @spoils_of_war = []
    end
  end
end
