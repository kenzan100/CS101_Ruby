def my_shuffle(arr)
  push_rand = ->(elem) { [elem, rand] }
  arr_with_rand = arr.map(&push_rand)
  arr_with_rand.sort_by{|elem_with_rand| elem_with_rand[1]}.map{|nested| nested[0]}
end

p my_shuffle([1,2,3,4,5,6])
