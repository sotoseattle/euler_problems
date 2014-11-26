require 'narray'

class Problem15
  def initialize(n_cells_x, n_cells_y)
    @n = n_cells_x + 1
    @m = n_cells_y + 1
    @a = NArray.float(@n, @m)
    process!
  end

  def at_border?(row, col)
    row == @n - 1 || col == @m - 1
  end

  def process!
    (0...@n).to_a.reverse.each do |row|
      (0...@m).to_a.reverse.each do |col|
        @a[row, col] = at_border?(row, col) ?  1 : @a[row+1, col] + @a[row, col+1]
      end
    end
  end

  def number_paths
    @a[0, 0]
  end
end

pb = Problem15.new(20, 20)
p pb.number_paths

# 137846528820
