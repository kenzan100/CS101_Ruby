def fib(n)
  return n if [-1,0,1].include? n
  return fib(n - 1) + fib(n - 2) if n > 1
  fib(n + 1) + fib(n + 2) if n < -1
end

p fib(10)
p fib(-10)

def max(nums, largest_so_far = 0)
  return largest_so_far if nums.empty?
  first, *rest = nums
  if first > largest_so_far
    largest_so_far = first
    max(rest, largest_so_far)
  else
    max(rest, largest_so_far)
  end
end

nums = [1, 100, 1002, 3]
p max(nums)

def sum(nums)
  return 0 if nums.empty?
  first, *rest = nums
  first + sum(rest)
end

another_sum = ->(x){x.(x)}.(
  ->(x){
    ->(nums){
      return 0 if nums.empty?
      nums[0] + x.(x).(nums[1..-1])
    }
  }
)

p another_sum.([1,2,3,4,5])

p sum([1,2,3,4,5])

def last_index_of(n, nums, possible_answer = -1, current_index = 0)
  if nums.empty?
    possible_answer
  else
    first, *rest = nums
    if first == n
      possible_answer = current_index
    end
    current_index += 1
    last_index_of(n, rest, possible_answer, current_index)
  end
end

p last_index_of(5, [1,2,4,6,2,7])
