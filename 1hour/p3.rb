require 'pp'
def fib(n)
  return n if n < 2
  fib(n-1) + fib(n-2)
end

def memo_fib
  # TODO
end

def imp_fib(z)
  i = 0
  while i < z
    if i < 2
      n = 0
      m = 1
    end
    l = n + m
    n = m
    m = l
    i += 1
  end
  l
end

pp (0..99).map{|n| imp_fib(n)}
