require_relative 'node'

class Board
  attr_reader :start_node

  def self.link_dirs
    [[1,0],[-1,0],[0,-1],[0,1]]
  end

  def initialize(maze_text)
    @grid = build_nodes(maze_text)
    set_links
  end

  def build_nodes(maze_text)
    maze_text.split("\n").map do |row|
      row.split('').map do |char|
        if(char =~ /S/)
          @start_node = Node.new(char)
        elsif(char =~ /E/)
          @end_node = Node.new(char)
        else
          char =~ /N/ ? Node.new(char) : nil
        end
      end
    end
  end

  def set_links
    @grid.map.with_index do |row, i|
      row.map.with_index do|node, j|
        add_links_at_index(node, i, j) if !node.nil?
      end
    end
  end

  def add_links_at_index(node, i, j)
    self.class.link_dirs.each do |dir_x, dir_y|
      if(in_bounds?(i + dir_x, j + dir_y))
        neighboring_node = @grid[i + dir_x][j + dir_y]
        if(!neighboring_node.nil?)
          node.add_link(neighboring_node)
        end
      end
    end
  end

  def in_bounds?(m, n)
    m.between?(0, @grid.length - 1) && n.between?(0, @grid[0].length - 1)
  end

  def render(visited=[])
    @grid.map do |row|
      row.map do |node|
        if(node.nil?)
           '*'
         else
          visited.include?(node) ? "V" : node.val
        end
      end.join(' ')
    end.join("\n") + "\n\n"
  end

  def found_end?(visited)
    visited.include?(@end_node)
  end

end
