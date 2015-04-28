require 'benchmark'

def bubble_sort(arr)
  return [] if arr.empty?
  arr.each_with_index do |elem, i|
    next_elem = arr[i+1]
    break unless next_elem
    if elem > next_elem
      arr[i] = next_elem
      arr[i+1] = elem
    end
  end
  bubble_sort(arr[0..-2]) + [arr.last]
end

def bubble_sort_imp(arr)
  (arr.length).times do |i|
    (arr.length).times do |j|
      print 'c '
      break unless arr[j+1]
      if arr[j] > arr[j+1]
        tmp = arr[j]
        arr[j] = arr[j+1]
        arr[j+1] = tmp
      end
    end
  end
  arr
end

time = Benchmark.measure do
  p bubble_sort_imp([3,2,1])
  puts
  p bubble_sort_imp([4,3,2,1])
  puts
  p bubble_sort_imp([5,4,3,2,1])
  puts
  p bubble_sort_imp([6,5,4,3,2,1])
end

# why bubble_sort O(n^2)?
# becuase each time you add an element to the list,
# you're comparing it to every other element of that list.
# and other element has to compare them to a newly added element as well.

# as length grows by 1,
# calc grows by length.

puts time.real
