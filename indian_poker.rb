require 'pp'
# for https://www.rco.recruit.co.jp/career/engineer/entry/pastexam

class IndianPoker
  attr_reader :ppl, :cards, :actual_hands
  def initialize(opt_hash)
    @ppl = ("A".."Z").to_a[0..(opt_hash[:ppl_size]-1)]
    @cards = (1..100).to_a[0..(opt_hash[:cards_size]-1)]
    @actual_hands = {}
  end

  def pick
    @ppl.each do |p|
      @actual_hands[p] = @cards.shuffle!.shift
    end
    pp @actual_hands
  end

  def calculate
    @ppl.each do |p|
      possible_guesses = [@actual_hands[p]] + @cards
      pp possible_guesses
    end
  end
end

id = IndianPoker.new(ppl_size: 3, cards_size: 5)
id.pick
id.calculate

