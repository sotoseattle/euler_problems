# Surprisingly there are only three numbers that can be written as the sum of
# fourth powers of their digits:

# 1634 = 14 + 64 + 34 + 44
# 8208 = 84 + 24 + 04 + 84
# 9474 = 94 + 44 + 74 + 44
# As 1 = 14 is not a sum it is not included.

# The sum of these numbers is 1634 + 8208 + 9474 = 19316.

# Find the sum of all the numbers that can be written as the sum of fifth powers
# of their digits.
POWER = 5
sol = []
(2..9_999_999).each do |n|
  narr = n.to_s.chars.map(&:to_i)
  sol << n if n == narr.map{ |e| e ** POWER }.reduce(:+)
end
p sol
p sol.reduce(:+)

# 248860 WRONG => go higher and stop when an additional order of magnitude
# doesnt change the result
