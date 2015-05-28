require 'pp'
def loop_sum(list)
  sum = 0
  for a in list
    sum += a
  end
  sum
end

def while_sum(list)
  sum = 0
  while !list.empty?
    first, *rest = list
    sum += first
    list = rest
  end
  sum
end

def recur_sum(list)
  return 0 if list.empty?
  first, *rest = list
  first + recur_sum(rest)
end

list = [1, 3, 5]
pp loop_sum(list)
pp while_sum(list)
pp recur_sum(list)
