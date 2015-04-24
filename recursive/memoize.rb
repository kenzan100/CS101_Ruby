h = Hash.new{ |h,k| h[k] = "fuga: #{k}" }
h["c"]
p h
