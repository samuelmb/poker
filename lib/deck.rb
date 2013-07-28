require_relative 'card'

class Deck
  SUITS = [:spades, :hearts, :diamonds, :clubs]

  def initialize
    @cards = new_deck
    @cards.shuffle!
  end

  def deal_hand
    deal_card(5)
  end

  def count
    @cards.length
  end

  def deal_card(num)
    unless num <= count
      raise "not enough cards in deck"
    end
    @cards.shift(num)
  end

  def new_deck
    cards = []
    2.upto(14).each do |rank|
      SUITS.each do |suit|
        cards << Card.new(rank, suit)
      end
    end
    cards
  end

  def shuffle
    @cards.shuffle!
  end

  def reset
    @cards = new_deck
  end

  def cards
    @cards.dup
  end
end