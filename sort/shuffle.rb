def my_shuffle(arr)
  push_rand = ->(elem) { [elem, rand] }
  arr_with_rand = arr.map(&push_rand)
  arr_with_rand.sort_by{|elem_with_rand| elem_with_rand[1]}.map{|nested| nested[0]}
end

p my_shuffle([1,2,3,4,5,6])

def knuth_shuffle(arr)
  remaining_arr_size = arr.length
  while remaining_arr_size >= 0
    rand_i = rand * remaining_arr_size
    remaining_arr_size -= 1
    tmp = arr[remaining_arr_size]
    arr[remaining_arr_size] = arr[rand_i]
    arr[rand_i] = tmp
  end
  arr
end

p knuth_shuffle([1,2,3,4,5,6])
