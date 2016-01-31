require 'pp'
def merge_sort(arr)
  if arr.length < 3
    return (arr[0] <= arr[1].to_i ? arr : [arr[1], arr[0]]).compact
  end
  middle_i = (arr.length / 2)
  merge(merge_sort(arr[0..middle_i]),
        merge_sort(arr[middle_i.succ..-1]))
end

def merge(arr1, arr2)
  return arr1 if arr2.empty?
  return arr2 if arr1.empty?
  sorted = if arr1[0] == arr2[0]
             [arr1.shift, arr2.shift]
           elsif arr1[0] < arr2[0]
             [arr1.shift]
           else
             [arr2.shift]
           end
  sorted + merge(arr1, arr2)
end

input = [3, 5, 1, 10, 4]
pp merge_sort(input)
