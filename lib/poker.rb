class Card
  attr_reader :rank, :suit
  include Comparable

  VALUES = {
    2 => "2",
    3 => "3",
    4 => "4",
    5 => "5",
    6 => "6",
    7 => "7",
    8 => "8",
    9 => "9",
    10 => "10",
    11 => "Jack",
    12 => "Queen",
    13 => "King",
    14 => "Ace"
  }

  #RANK: 2 - 14
  def initialize(rank, suit)
    @rank, @suit = rank, suit
  end

  def <=>(other_card)
    self.rank <=> other_card.rank
  end

  def self.parse(string)
    suit = string[0]
    rank = string[1]

    suit_hash = {
      "c" => :clubs,
      "h" => :hearts,
      "d" => :diamonds,
      "s" => :spades
    }

    rank_hash = {
      "2" => 2,
      "3" => 3,
      "4" => 4,
      "5" => 5,
      "6" => 6,
      "7" => 7,
      "8" => 8,
      "9" => 9,
      "T" => 10,
      "J" => 11,
      "Q" => 12,
      "K" => 13,
      "A" => 14
    }
    Card.new(rank_hash[rank], suit_hash[suit])
  end

end # end CARD

#_______________________________________________________
class Deck
  SUITS = [:spades, :hearts, :diamonds, :clubs]

  def initialize
    @cards = new_deck
    @cards.shuffle!
  end

  def deal_hand
    deal_card(5)
  end

  def deal_card(num)
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

  def reset
    @cards = new_deck
  end

  def cards
    @cards.dup
  end
end # end DECK

#_______________________________________________________
class Hand

  def initialize(cards)
    @cards = cards.sort
  end

  def cards
    @cards.dup
  end

  def evaluate_strength
    [hand_strength, significant_value]
  end

  def hand_strength


  end


  def royal_flush?
    straight_flush? && cards.all? { |card| card.rank > 9 }
  end

  def straight_flush?
    straight? && flush?
  end

  def four_of_a_kind?
    count_duplicates == [4]
  end

  def full_house?
    count_duplicates == [2, 3]
  end

  def flush?
    cards.map { |card| card.suit }.uniq.length == 1
  end

  def straight?
    (cards.length - 1).times do |i|
      if cards[i + 1].rank - cards[i].rank != 1
        return false
      end
    end
    true
  end

  def three_of_a_kind?
    count_duplicates == [3]
  end

  def two_pairs?
    count_duplicates == [2, 2]
  end

  def one_pair?
    count_duplicates == [2]
  end

  def high_card?
    count_duplicates.empty? && !straight? && !flush?
  end

  def count_duplicates
    count = Hash.new(0)
    cards.map { |card| card.rank }.each do |rank|
      count[rank] += 1
    end
    count.values.select { |count| count > 1 }.sort
  end



end # end HAND

#_______________________________________________________
class Game
  def initialize
    @deck = Deck.new
  end

    #Hand.new(@deck.deal)
end

#_______________________________________________________
class Player
end