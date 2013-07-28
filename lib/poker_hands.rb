module PokerHands
  def hand_strength
    if royal_flush?
      9
    elsif straight_flush?
      8
    elsif four_of_a_kind?
      7
    elsif full_house?
      6
    elsif flush?
      5
    elsif straight?
      4
    elsif three_of_a_kind?
      3
    elsif two_pairs?
      2
    elsif one_pair?
      1
    else
      0
    end
  end

  def significant_value
    case hand_strength
    when 9
      0
    when 8
      cards.last.rank
    when 7

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
end