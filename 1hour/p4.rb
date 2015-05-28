require 'pp'
# my strategy
# sort by first char of number element
# if first char is the same number,
# it stores nth number until it gets the last letter

def lpn(arr)
  arr.sort do |a,b|
    digit_calc = lambda{|n,i| n.to_s[i].to_i}
    index = 0
    a_val = digit_calc.call(a,index)
    b_val = digit_calc.call(b,index)
    if a_val == b_val
      if a.to_s.length == b.to_s.length
        a <=> b
      else
        -1 * (a.to_s.length <=> b.to_s.length)
      end
    else
      a_val <=> b_val
    end
  end.reverse.reduce("") do |acc, n|
    acc += n.to_s
    acc
  end.to_i
end

arr = [50, 2, 500, 101, 100, 9]
pp lpn(arr)
