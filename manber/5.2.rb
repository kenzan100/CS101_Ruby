inputs = [[5,4,1], 3]
def polynomial1(num_arr, x)
  first, *rest = num_arr
  return first if rest.empty?
  polynomial1(rest, x) + first * (x ** (num_arr.length - 1))
end

puts polynomial1(*inputs)

def polynomial2 (num_arr, x, powers_x)
	*rest, tail = num_arr
	return (tail * powers_x) if rest.empty?
	next_powers_x = x * powers_x
	polynomial2(rest, x, next_powers_x) + (tail * powers_x)
end  # 最初はprev_powers_xに1を渡す

puts polynomial2(*inputs, 1)

def polynomial3 (num_arr, x)
	*rest, tail = num_arr
	return tail if rest.empty?
	x * polynomial3(rest, x) + tail
end

puts polynomial3(*inputs)
