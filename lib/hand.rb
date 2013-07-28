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

  def <=>(other_hand)
  end


end