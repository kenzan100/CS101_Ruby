# require 'byebug'
def add_each_digit(n)
  m, l = n.divmod(10)
  return l if m == 0
  l + add_each_digit(m)
end

def add_each_digit2(num)
  num_length = num.to_s.split('').length
  return num if num_length == 1
  num_divider = (10 ** (num_length-1))
  m, l = num.divmod(num_divider)
  m + add_each_digit2(l)
end

puts add_each_digit(12301019030449)
puts add_each_digit2(12301019030449)
puts add_each_digit2(12)
