Node = Struct.new(:value, :l, :r)

tree1 = Node.new(1,
  Node.new(2,
    Node.new(3),
    Node.new(4)),
  Node.new(5,
    Node.new(6),
    Node.new(7))
)

def sum_tree_val(tree)
  return 0 if tree.nil?
  tree.value + sum_tree_val(tree.l) + sum_tree_val(tree.r)
end

p sum_tree_val(tree1)

def p_tree_by_depth(tree)
  print tree.value
  p_tree_by_depth(tree.l) unless tree.l.nil?
  p_tree_by_depth(tree.r) unless tree.r.nil?
end

p p_tree_by_depth(tree1)

def p_tree_by_level(tree)
  print tree.value
  p_sub_tree_by_level(tree)
end

def p_sub_tree_by_level(tree)
  print tree.l.value unless tree.l.nil?
  print tree.r.value unless tree.r.nil?
  p_sub_tree_by_level(tree.l) unless tree.l.nil?
  p_sub_tree_by_level(tree.r) unless tree.r.nil?
end

p p_tree_by_level(tree1)
