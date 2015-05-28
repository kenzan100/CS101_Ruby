require 'pp'
numbers = (1..9).to_a
operators = ["+", "-", ""]

operators.repeated_permutation(8).each_with_index do |ops,i|
  # break if i > 2
  expression = numbers.zip(ops).join
  if eval(expression) == 100
    pp "#{expression} = 100"
  end
end
