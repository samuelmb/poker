require 'rspec'
require 'poker'

describe "poker" do

  let(:deck) { Deck.new }

  # clubs
  let(:c2) { Card.parse("c2") }
  let(:c3) { Card.parse("c3") }
  let(:c4) { Card.parse("c4") }
  let(:c5) { Card.parse("c5") }
  let(:c6) { Card.parse("c6") }
  let(:c7) { Card.parse("c7") }
  let(:c8) { Card.parse("c8") }
  let(:c9) { Card.parse("c9") }
  let(:cT) { Card.parse("cT") }
  let(:cQ) { Card.parse("cQ") }
  let(:cK) { Card.parse("cK") }
  let(:cA) { Card.parse("cA") }
  # diamonds
  let(:d2) { Card.parse("d2") }
  let(:d3) { Card.parse("d3") }
  let(:d4) { Card.parse("d4") }
  let(:d5) { Card.parse("d5") }
  let(:d6) { Card.parse("d6") }
  let(:d7) { Card.parse("d7") }
  let(:d8) { Card.parse("d8") }
  let(:d9) { Card.parse("d9") }
  let(:dT) { Card.parse("dT") }
  let(:dQ) { Card.parse("dQ") }
  let(:dK) { Card.parse("dK") }
  let(:dA) { Card.parse("dA") }
  # hearts
  let(:h2) { Card.parse("h2") }
  let(:h3) { Card.parse("h3") }
  let(:h4) { Card.parse("h4") }
  let(:h5) { Card.parse("h5") }
  let(:h6) { Card.parse("h6") }
  let(:h7) { Card.parse("h7") }
  let(:h8) { Card.parse("h8") }
  let(:h9) { Card.parse("h9") }
  let(:hT) { Card.parse("hT") }
  let(:hQ) { Card.parse("hQ") }
  let(:hK) { Card.parse("hK") }
  let(:hA) { Card.parse("hA") }
  # spades
  let(:s2) { Card.parse("s2") }
  let(:s3) { Card.parse("s3") }
  let(:s4) { Card.parse("s4") }
  let(:s5) { Card.parse("s5") }
  let(:s6) { Card.parse("s6") }
  let(:s7) { Card.parse("s7") }
  let(:s8) { Card.parse("s8") }
  let(:s9) { Card.parse("s9") }
  let(:sT) { Card.parse("sT") }
  let(:sQ) { Card.parse("sQ") }
  let(:sK) { Card.parse("sK") }
  let(:sA) { Card.parse("sA") }

  #Ace of Spades
  let(:aoC) { Card.new(14, :clubs) }
  #Jack of Clubs
  let(:joC) { Card.new(11, :clubs) }
  #ten of Hearts
  let(:toC) { Card.new(10, :clubs) }
  #Queen of Diamonds
  let(:qoC) { Card.new(12, :clubs) }
  #King of Clubs
  let(:koC) { Card.new(13, :clubs) }

  let(:hand) { Hand.new(deck.deal_hand) }

  let(:straight_flush_hand) { Hand.new([toC, joC, qoC, koC, aoC])}
  let(:four_of_a_kind_hand) { Hand.new([c2, d2, h2, s2, sA]) }
  let(:full_house_hand) { Hand.new([c2, s2, d2, s5, d5])}
  let(:three_of_a_kind_hand) { Hand.new([dA, sA, cA, cK, dQ]) }
  let(:two_pair_hand) { Hand.new([d7, s7, s3, h6, c6])}
  let(:one_pair_hand) { Hand.new([d7, c7, sT, cQ, cK]) }
  let(:high_card) { Hand.new([d8, c3, s5, hT, dA]) }




  describe "card" do

    it "understands its rank" do
      #(AoS <=> JoS).should == 1
      aoC.should > joC
    end

    it "can be sorted by rank" do
      [aoC, joC, toC, qoC, koC].sort.should == [toC, joC, qoC, koC, aoC]
    end

    it "can parse cards" do
      cA.should == aoC
    end
  end


  describe "deck" do

    it "has 52 cards" do
      deck.cards.length.should == 52
    end

    it "should always deal hands with five unique cards" do
      deck.deal_hand.uniq.length.should == 5
    end

    it "has at least one of every card (not testing every)" do
      deck.cards.any? { |card| card == joC }.should be_true
      deck.cards.any? { |card| card == qoC }.should be_true
    end

  end

  describe "hand" do

    it "has five cards" do
      hand.cards.length.should == 5
    end

    it "has five unique cards" do
      hand.cards.uniq.length.should == 5
    end

    it "recognizes straights" do
      straight_flush_hand.should be_straight
    end

    it "recognizes flushes" do
      straight_flush_hand.should be_flush
    end

    it "recognizes full house" do
      full_house_hand.should be_full_house
    end

    it "recognizes four of a kind" do
      four_of_a_kind_hand.should be_four_of_a_kind
    end

    it "recognizes three of a kind" do
      three_of_a_kind_hand.should be_three_of_a_kind
    end

    it "recognizes two pairs" do
      two_pair_hand.should be_two_pairs
    end

    it "recognizes one pair" do
      one_pair_hand.should be_one_pair
    end

    it "recognizes high cards" do

    end

  end
end #end POKER