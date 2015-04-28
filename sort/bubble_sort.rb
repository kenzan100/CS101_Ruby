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

p bubble_sort([3,2,1,4,10,0,-10])
