INPUT = [123, 123, 1, 2, 4, 10, 120, 121, 122, 123]
def cyclic_search(l, r)
  if (r - l) < 2
    return INPUT[r] <= INPUT[l] ? r : l
  end
  middle = (r + 1) / 2
  if INPUT[middle] <= INPUT[r]
    cyclic_search(l, middle)
  else
    cyclic_search((middle + 1), r)
  end
end

puts cyclic_search(0, (INPUT.length-1))
