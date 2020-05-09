class Turn
attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    player1_card_0 = @player1.deck.rank_of_card_at(0)
    player2_card_0 = @player2.deck.rank_of_card_at(0)
    player1_card_2 = @player1.deck.rank_of_card_at(2)
    player2_card_2 = @player2.deck.rank_of_card_at(2)

    if  player1_card_0 > player2_card_0 || player2_card_0 > player1_card_0
      :basic
    elsif player1_card_0 == player2_card_0 && player1_card_2 == player2_card_2
      :mutually_assured_destruction
    elsif
      player1_card_0 == player2_card_0
      :war
    end
  end

  def winner
    player1_card_0 = @player1.deck.rank_of_card_at(0)
    player2_card_0 = @player2.deck.rank_of_card_at(0)
    player1_card_2 = @player1.deck.rank_of_card_at(2)
    player2_card_2 = @player2.deck.rank_of_card_at(2)

    if player1_card_0 > player2_card_0
      @player1
    elsif player2_card_0 > player1_card_0
      @player2
    elsif player1_card_0 == player2_card_0 && player1_card_2 == player2_card_2
      "No Winner"
    elsif player1_card_0 == player2_card_0 && player1_card_2 > player2_card_2
      @player1
    elsif
      player1_card_0 == player2_card_0 && player2_card_2 > player1_card_2
      @player2
    end
  end

  def pile_cards
    player1_card_0 = @player1.deck.rank_of_card_at(0)
    player2_card_0 = @player2.deck.rank_of_card_at(0)
    player1_card_2 = @player1.deck.rank_of_card_at(2)
    player2_card_2 = @player2.deck.rank_of_card_at(2)

    if player1_card_0 > player2_card_0 || player2_card_0 > player1_card_0
      @spoils_of_war << @player1.deck.remove_card
      @spoils_of_war << @player2.deck.remove_card
    elsif player1_card_0 == player2_card_0 && player1_card_2 == player2_card_2
      @player1.deck.remove_card
      @player1.deck.remove_card
      @player1.deck.remove_card
      @player2.deck.remove_card
      @player2.deck.remove_card
      @player2.deck.remove_card
    elsif player1_card_0 == player2_card_0
      @spoils_of_war << @player1.deck.remove_card
      @spoils_of_war << @player1.deck.remove_card
      @spoils_of_war << @player1.deck.remove_card
      @spoils_of_war << @player2.deck.remove_card
      @spoils_of_war << @player2.deck.remove_card
      @spoils_of_war << @player2.deck.remove_card
    end
    @spoils_of_war
  end

  def award_spoils(winner)
    winner.deck.add_card(@spoils_of_war)
    @spoils_of_war = []
    winner.deck.cards.flatten
  end
end
