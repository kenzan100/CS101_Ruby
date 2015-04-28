def merge_sort(arr)
  nested_arr = arr.map{|n| [n]}
  nested_merge_sort(nested_arr)
end

def nested_merge_sort(arr)
  return arr[0] if arr.length == 1
  nested_sorting = []
  arr.each_slice(2) do |arr1, arr2|
    nested_sorting << merge_sorted(arr1, arr2)
  end
  nested_merge_sort(nested_sorting)
end

def merge_sorted(arr1, arr2)
  return [*arr1, *arr2].compact if [arr1, arr2].any?{|a| a.nil?}
  first1, *rest1 = arr1
  first2, *rest2 = arr2
  unless [first1, first2].all? #either is nil
    return [first1, first2, *rest1, *rest2].compact
  end
  if first1 <= first2
    [first1] + merge_sorted(rest1, arr2)
  else
    [first2] + merge_sorted(arr1, rest2)
  end
end

p merge_sort([2,5,10,200,6,12,20,-10])
