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
    if  player1_card_0 > player2_card_0 || player2_card_0 > player1_card_0
      :basic
    else
      nil
    end
  end

  def winner
    player1_card_0 = @player1.deck.rank_of_card_at(0)
    player2_card_0 = @player2.deck.rank_of_card_at(0)

    if player1_card_0 > player2_card_0
      @player1
    elsif player2_card_0 > player1_card_0
      @player2
    else
      nil
    end
  end

    def pile_cards
      player1_card_0 = @player1.deck.rank_of_card_at(0)
      player2_card_0 = @player2.deck.rank_of_card_at(0)
      if player1_card_0 > player2_card_0
        @spoils_of_war << @player1.deck.remove_card
        @spoils_of_war << @player2.deck.remove_card
      end
    end

  end
