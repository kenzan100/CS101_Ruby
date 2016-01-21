require 'pp'

def wrong_max_subsequence(arr, max_arr, state)
  n, *rest = arr
  return max_arr unless n
  case
  when n < 0
    state = 'split'
  when n >= 0
    case state
    when 'ongoing'
      max_arr << n
    when 'split'
      if max_arr.reduce(:+) < n
        state = 'ongoing'
        max_arr = [n]
      end
    end
  end
  max_subsequence(rest, max_arr, state)
end

# pp max_subsequence([1, 0.5, -3, 10, -4, 0.4, 12, 2, -10], [], 'ongoing')
# pp max_subsequence([2, -3, 1.5, -1, 3, -2, -3, 3], [], 'ongoing')
