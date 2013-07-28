require_relative 'card'
require_relative 'poker_hands'

class Hand
  include
  def initialize(cards)
    @cards = cards.sort
  end

  def cards
    @cards.dup
  end


  def <=>(other_hand)
    if hand_strength == other_hand.hand_strength
      tie_breaker
    else
      hand_strength <=> other_hand.hand_strength
    end
  end


end