# it goes +1 to x, it goes +1 to y, send 2 things together,
# and sum them up eventually.
# when it gets the goal cell, it returns you 1.
# if it hit the wall, it returns you 0.
#
# to memoize this,
def ways(x,y,grid_size=300)
  return 0 if x > grid_size || y > grid_size
  return 1 if x == grid_size && y == grid_size
  @ways ||= Hash.new{|h,k| h[k] = ways(*k) }
  @ways[[x+1,y]] + @ways[[x,y+1]]
end

p ways(0,0)
