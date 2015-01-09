def bfs(value)
  queue = [@root]

  while !queue.empty?
    current_node = qure.pop
    p current_node.value
    return current_node if current_node.value == value
    queue.unshift(current_node.left) if !current_node.left.nil?
    queue.unshift(current_node.right) if !current_node.right.nil?
  end
  
  return nil
end
