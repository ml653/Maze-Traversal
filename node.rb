class Node
  attr_reader :val, :links

  def initialize val
    @val = val
    @links = []
  end

  def add_link(node)
    @links << node unless (links.include?(node))
  end

end
