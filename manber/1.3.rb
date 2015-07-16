require 'pp'
def make_ol(list)
  possible_arr = []
  list.each do |n|
    possible_arr.each do |arr|
      i = (arr.length - 1)
      while i >= 0
        if arr[i] < n
          arr.delete_if{ |m| m > n }
          arr << n
          break
        end
        i -= 1
      end
    end
    possible_arr << [n]
    pp possible_arr
  end
  possible_arr.max{ |a,b| a.length <=> b.length }
end

pp make_ol([9, 44, 32, 12, 7, 42])
