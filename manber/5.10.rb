require 'pp'
require 'byebug'

# K = 16
# def first_knapsack(possible_cases, arr)
#   n, *rest = arr
#   return [n] if n == K
#   return false if n.nil?
#
#   unless n > K
#     possible_cases.each do |p_case|
#       new_p_case = (p_case.reduce(:+) + n)
#       if new_p_case == K
#         return p_case << n
#       elsif new_p_case < K
#         possible_cases << new_p_case
#       end
#     end
#     possible_cases << [n]
#   end
#   first_knapsack(possible_cases, rest)
# end
#
# pp first_knapsack([], [2,3,5,6])


def expo_knapsack(arr, k)
  pp [arr, k]
  return [] if k == 0
  if arr.length == 1
    if arr.first == k
      return arr
    else
      return false
    end
  end

  first, *rest = arr
  if already_knapsacked = expo_knapsack(rest, k)
    return already_knapsacked
  else
    smaller_knapsack = k - first
    return false if smaller_knapsack < 0

    if already_small_knapsacked = expo_knapsack(rest, smaller_knapsack)
      [first] + already_small_knapsacked
    else
      false
    end
  end
end

pp expo_knapsack([2,3,5,6], 16)


# def dynamic_knapsack(arr, kk)
#   cell = Struct.new(:exist, :belong)
#   matrix = []
#   matrix[0] = []
#   matrix[0][0] = cell.new(true, false)
#   kk.times do |k|
#     matrix[0][k+1] = cell.new(false, false)
#   end
#   arr.length.times do |i|
#     kk.times do |k|
#       k += 1
#       matrix[i] ||= []
#       matrix[i][k] = cell.new(false, false)
#       if matrix[i-1][k].exist
#         matrix[i][k].exist  = true
#         matrix[i][k].belong = true
#       elsif (k - arr[i]) >= 0
#         if matrix[i-1][k - arr[i]].exist
#           matrix[i][k].exist  = true
#           matrix[i][k].belong = true
#         end
#       end
#     end
#   end
#   matrix
# end
#
# pp dynamic_knapsack([1,2,3], 6)
