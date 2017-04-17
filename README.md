## Maze Traversal

Visualization of breadth-first and depth-first search.  It requires no additional files or gems.

### How to use

Just run "ruby maze_traversal.rb" you are good to go!

### Example

```
ruby maze_traverser.rb

S N N N N N N N N N N N N N N N * N N N
N * N * * * * * * * * N * * * N * N * N
N * N * N * N N N N * N * N * N * N * N
N * N * N * N * * N * N * N * N N N * N
N * N * N * N * * N * N * N * * * * * N
N * N * N * N * * N * N * N * N N N N N
N * N N N * N * * N * N * N * N * * * N
N * * * * * N * * N * N * N * N N N * N
N N N N N N N * * N * N * N * * * N * N
* * * * * * * * * N * N * N * * * N * N
N N N N N N N N N N * N * N * * * N * N
N * * * * * * * * * * N N N * * * N * N
N N N N N N N N N N * * * * * N N N * N
* * * * * * * N * N * * N N N N * * * N
N N N N N N N N * N * * * * * * * * N N
N N * * * * * N * N * * N N N N N N N N
N * * * N * * N * N * * N * * * * * * *
N N N N N * * N * N * * N N N N N N N N
* * * * * * * N * N * * * * * * * * * *
N N N N N N N N * N N N N N N N N N N E

S = starting node
E = ending node
V = visited node
N = node
* = wall
Please enter 'dfs' or 'bfs' for depth-first search or breadth-first search respectively (case insensitive).
```

### Additional
Feel free to add in your own mazes via text files.  Just be sure to denote the starting and end nodes with S and E.  You can run them via
"ruby maze_traverser.rb 'name_of_your_file'".
