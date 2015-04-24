def arr_permu(arr)
  sum = []
  sum << r_permu(arr)
end

def r_permu(arr)
  return '' if arr.empty?
  first, *rest = arr
  rest.length.times do |i|
    rest.rotate(i)
    first + arr_permu(rest)
  end
end

# I don't know how I can reproduce head char to match the rest of recursion.

# tiles = %w(s u p e)
# tiles.length.times do |i|
#   tiles.permutation(i).to_a
# end

def kids_ways(length, steps_so_far=0)
  return 1 if steps_so_far == length
  return 0 if steps_so_far > length
  [1,2,3].map do |n|
    kids_ways(length, steps_so_far + n)
  end.reduce(:+)
end

p kids_ways(10)
