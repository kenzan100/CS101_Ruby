class Node
  attr_accessor :left, :right
  def initialize(args={})
    self.left  = args[:left]
    self.right = args[:right]
  end
end

tree = Node.new(
  left: Node.new(
    left:  Node.new(),
    right: Node.new(
      left: Node.new()
    )
  )
)

def all_balance_factors(tree)
  res << balance_factor(tree.left)
  res << balance_factor(tree.right)
end

def balance_factor(tree)
  height(tree.left) - height(tree.right)
end

def height(tree)
  return 0 if [tree.left, tree.right].all?(&:nil?)
  return height(tree.left)  + 1 if tree.right.nil?
  return height(tree.right) + 1 if tree.left.nil?
  [height(tree.left).to_i, height(tree.right).to_i].max + 1
end

puts height(tree)
