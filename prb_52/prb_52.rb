# It can be seen that the number, 125874, and its double, 251748, contain exactly
# the same digits, but in a different order.

# Find the smallest positive integer, x, such that 2x, 3x, 4x, 5x, and 6x, contain
# the same digits.

def align(n)
  n.to_s.chars.sort.join
end

n = 1
while n < 1_000_000
  ns = align(n)
  puts n if ns == align(2*n) &&
            ns == align(3*n) &&
            ns == align(4*n) &&
            ns == align(5*n) &&
            ns == align(6*n)
  n += 1
end
