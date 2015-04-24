# what is a 'hand'?
# hand is defined by 'suite' and 'number'.
#
# each card has a unique suite and number.
# there're 4 suites, and 13 numbers in each suite, thus 52 cards in total.
#
# here, we assume a simple hand that involve numbers, 'a pair'.
# how do we know if your hand is 'a pair'?

Card = Struct.new(:suite, :number)
deck = []
13.times do |i|
  [:♡, :♠︎, :♣︎, :♦︎].each do |suite|
    deck << Card.new(suite, i+1)
  end
end

def pp_card(arr)
  return nil unless arr
  arr.map{|c| "#{c.suite}#{c.number}" }.join(' ')
end

pair_check = ->(arr){
  arr.combination(2).none?{|pair| pair[0].number == pair[1].number }
}

pairs = deck.combination(5).select do |hand|
  pair_check.(hand)
end

puts deck.combination(5).size
puts pairs.size
