# Starting with the number 1 and moving to the right in a clockwise direction
# a 5 by 5 spiral is formed as follows:

# 21 22 23 24 25
# 20  7  8  9 10
# 19  6  1  2 11
# 18  5  4  3 12
# 17 16 15 14 13

# It can be verified that the sum of the numbers on the diagonals is 101.

# What is the sum of the numbers on the diagonals in a 1001 by 1001 spiral formed
# in the same way?

require 'narray'

def reframe(painting)
  a = painting.shape[0]

  # make a frame
  n = a + 2
  frame = NArray.int(n, n)

  # place painting in frame
  frame[1..a, 1..a] = painting

  # fill frame
  base = (a**2..n**2).to_a
  i = 0
  frame[n-1, true] = base[i, n]
  i += n-1
  frame[0, n-1] = base[i, n].reverse
  i += n-1
  frame[0, true] = base[i, n].reverse
  i += n-1
  frame[0, 0] = base[i, n]
  frame
end

def dia(matrix)
  a = matrix.shape[0]
  sum = [*(0...a)].map { |i| matrix[i, i] }.reduce(:+)
  matrix = matrix.rot90
  sum += [*(0...a)].map { |i| matrix[i, i] }.reduce(:+)
  sum
end

seed = NArray[1].reshape(1,1)
while seed.shape[0] != 1001
  seed = reframe(seed)
end

p dia(seed) - 1 # dont add twice the center 1
