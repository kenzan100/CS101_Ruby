require 'pp'

K = 4
def first_knapsack(possible_cases, arr)
  n, *rest = arr
  return [n] if n == K
  return false if n.nil?

  unless n > K
    possible_cases.each do |p_case|
      new_p_case = (p_case.reduce(:+) + n)
      if new_p_case == K
        return p_case << n
      elsif new_p_case < K
        possible_cases << new_p_case
      end
    end
    possible_cases << [n]
  end
  first_knapsack(possible_cases, rest)
end

pp first_knapsack([], [2,3,3,1])
