require_relative 'board'

class MazeTraverser

  attr_accessor :board

  def initialize(maze_file)
    contents = File.read(maze_file).chomp
    @board = Board.new(contents)
    @visited = []
  end

  def bfs
    queue = [@board.start_node]
    while(!queue.empty?)
      sleep(0.1)
      puts @board.render(@visited)

      node = queue.shift
      @visited << node
      node.links.each {|neighbor| queue << neighbor unless @visited.include?(neighbor)}
      if(@board.found_end?(@visited))
        puts "End has been found!"
        return
      end
    end
  end

  def dfs(node = @board.start_node)
    sleep(0.1)
    puts @board.render(@visited)

    @visited << node
    if(@board.found_end?(@visited))
      puts "End has been found!"
      return true
    else
      node.links.each do |neighbor|
        if !@visited.include?(neighbor)
          found = dfs(neighbor)
          return true if found
        end
      end
      nil
    end
  end

  def show_explanation
    puts @board.render
    puts "S = starting node\n"\
        "E = ending node\n"\
        "V = visited node\n"
  end

  def traverse
    case get_traversal_type
    when /dfs/
      dfs
    when /bfs/
      bfs
    else
      traverse
    end
  end

  def get_traversal_type
    puts "Please enter 'dfs' or 'bfs' for depth-first search "\
      "or breadth-first search respectively (case insensitive)."
    gets.chomp.downcase
  end

end

if __FILE__ == $PROGRAM_NAME
  file_name = ARGV[0] || "maze.txt"
  traverser = MazeTraverser.new(file_name)
  traverser.show_explanation
  traverser.traverse
end
