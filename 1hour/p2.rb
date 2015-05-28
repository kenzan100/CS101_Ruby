require 'pp'
list1 = %w(a b c d e)
list2 = [1, 2, 3, 4]

def my_zip(list1, list2)
  case
  when list1.empty? && list2.empty?
    return []
  when list1.empty?
    return list2
  when list2.empty?
    return list1
  end
  first1, *rest1 = list1
  first2, *rest2 = list2
  [first1, first2] + my_zip(rest1, rest2)
end

pp my_zip(list1, list2)
pp list1.zip(list2).flatten
