require './lib/deck'

RSpec.describe Deck do
  before(:each) do
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)
    @cards = [@card1, @card2, @card3]
    @deck = Deck.new(@cards)
  end
  it "exists" do
    expect(@deck).to be_an_instance_of(Deck)
  end

  it "has readable attributes" do
    expect(@deck.cards).to eq @cards
  end

  it "can return the rank of a card" do
    expect(@deck.rank_of_card_at(0)).to eq 12
    expect(@deck.rank_of_card_at(2)).to eq 14
  end

  it "can return high ranking cards" do
    expect(@deck.high_ranking_cards).to eq([@card1, @card3])
  end

  it "can return the percentage of high ranking cards" do
    expect(@deck.percent_high_ranking).to eq 66.67
  end

  it "can remove a card" do
    expect(@deck.remove_card).to eq [@card1]
  end
end
