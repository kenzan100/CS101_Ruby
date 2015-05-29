require 'pp'
# my strategy
# sort by (n+1)th char of number element,
# as long as nth char is the same number.

def lpn(arr)
  arr.sort do |a,b|
    digit_calc = lambda{|n,i| n.to_s[i].to_i}
    index = 0
    begin
      a_val = digit_calc.call(a,index)
      b_val = digit_calc.call(b,index)
      index += 1
    end while a_val == b_val && (a.to_s[index] || b.to_s[index])
    a_val <=> b_val
  end.reverse.reduce("") do |acc, n|
    acc += n.to_s
    acc
  end.to_i
end

arr = [2, 221, 25, 9, 1, 10]
pp lpn(arr)
