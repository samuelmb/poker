# -*- coding: utf-8 -*-
require 'colorize'


class Card
  attr_reader :rank, :suit
  include Comparable

  SUIT_STRINGS = {
    :clubs    => "♣",
    :diamonds => "♦",
    :hearts   => "♥",
    :spades   => "♠"
  }

  RANK_STRINGS = {
    2 => "2",
    3 => "3",
    4 => "4",
    5 => "5",
    6 => "6",
    7 => "7",
    8 => "8",
    9 => "9",
    10 => "T",
    11 => "J",
    12 => "Q",
    13 => "K",
    14 => "A"
  }

  #RANK: 2 - 14
  def initialize(rank, suit)
    @rank, @suit = rank, suit
  end

  def <=>(other_card)
    self.rank <=> other_card.rank
  end

  def color
    if suit == :clubs || suit == :spades
      :white
    else
      :red
    end
  end

  def to_s
    (RANK_STRINGS[rank] + SUIT_STRINGS[suit]).colorize(color)
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

end