require 'pp'
require 'byebug'

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

def max_subsequence(arr, cur_max, tmp_max)
  arr_sum = Proc.new{|ar| ar.reduce(0){|accu, e| accu += e}}
  n, *rest = arr
  return cur_max unless n
  tmp_max << n
  tmp_max = [] if arr_sum.call(tmp_max) < 0
  if arr_sum.call(cur_max) <= arr_sum.call(tmp_max)
    cur_max = tmp_max.dup
  end
  max_subsequence(rest, cur_max, tmp_max)
end

pp max_subsequence([2, -3, 1.5, -1, 3, -2, -3, 3], [], [])
