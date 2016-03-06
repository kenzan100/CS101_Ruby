require 'byebug'
require 'pp'
def is_prime(num)
  (num-1).downto(2).each do |ii|
    return false if num % ii == 0
  end
  true
end

def iq_test(numbers)
  evens, odds = numbers.split(' ').map.with_index{|num,i| [num.to_i,i]}.partition{|num,i| num.even?}
  evens.length == 1 ? evens.first[1] : odds.first[1]
end

def song_decoder(string)
  string.split('WUB').reject(&:empty?).join(' ')
end

# puts song_decoder('WUBWEWUBAREWUBWUBTHEWUBCHAMPIONSWUBMYWUBFRIENDWUB')


def sum_pairs(possibles, sum)
  sum_pairs = []
  possibles.map.with_index.to_a.combination(2) do |first, second|
    sum_pairs << [[first[0],second[0]], second[1]] if (first[0] + second[0] == sum)
  end
  return nil if sum_pairs.empty?
  sum_pairs.sort_by{|pair,i|i}.first[0]
end

# pp sum_pairs([20, -13, 40], -7)
# pp sum_pairs([10, 5, 2, 3, 7, 5], 10)


def palindrome_chain_length(num)
  steps = 0
  reverse_proc = ->(n){n.to_s.split(//).reverse.join.to_i}
  special_proc = ->(n,r){steps += 1; n + r}
  while true
    reversed = reverse_proc.call(num)
    return steps if num == reversed
    num = special_proc.call(num, reversed)
  end
end

pp palindrome_chain_length(87)
