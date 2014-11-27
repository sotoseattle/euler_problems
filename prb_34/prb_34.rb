# 145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.
# Find the sum of all numbers which are equal to the sum of the factorial of their digits.
# Note: as 1! = 1 and 2! = 2 are not sums they are not included.

def facto(n)
  return 1 if n < 2
  (1..n).to_a.reduce(:*)
end

def freaky_facto(n)
  n.to_s.chars.map { |c| facto(c.to_i) }.reduce(:+)
end

p (3..1_00_000).to_a.select { |n| freaky_facto(n) == n }.reduce(:+)

