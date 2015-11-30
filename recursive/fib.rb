def fib(n)
  fib_iter(1, 0, n)
end

def fib_iter(bn1, bn2, n)
  return bn2 if n == 0
  fib_iter((bn1 + bn2), bn1, (n-1))
end

p fib(100)
