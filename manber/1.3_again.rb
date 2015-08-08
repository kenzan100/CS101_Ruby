require 'pp'
def reject_sort(arr)
  possible_arrs = []
  arr.each do |n|
    possible_arrs = possible_arrs.map do |p_arr|
      truncated_arr = p_arr.reject{ |p_n| n < p_n }
      truncated_arr << n
    end
    pp possible_arrs
    possible_arrs << [n]
  end
end

reject_sort([9,44,32,12,7,42,34])
