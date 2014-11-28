# A googol (10^100) is a massive number: one followed by one-hundred zeros;
# 100^100 is almost unimaginably large: one followed by two-hundred zeros.
# Despite their size, the sum of the digits in each number is only 1.

# Considering natural numbers of the form, a^b, where a, b < 100,
# what is the maximum digital sum?

# y = a^b => b = log_a(y)
# if y = 123 = 1x10^3 + 2x10^2 + 3x10^0

range = [*(1...100)]
p range.product(range)
       .map { |a,b| (a**b).to_s.chars.map(&:to_i).reduce(:+) }
       .max
