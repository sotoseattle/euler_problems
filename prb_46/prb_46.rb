# It was proposed by Christian Goldbach that every odd composite number can be
# written as the sum of a prime and twice a square.

# 9 = 7 + 2×12
# 15 = 7 + 2×22
# 21 = 3 + 2×32
# 25 = 7 + 2×32
# 27 = 19 + 2×22
# 33 = 31 + 2×12

# It turns out that the conjecture was false.

# What is the smallest odd composite that cannot be written as the sum of a
# prime and twice a square?
require 'prime'

def at_least_one_is_goldbach?(n)
  Prime.each(n).map.any? do |prime|
    x = Math.sqrt((n - prime)/2.0)
    x == x.to_i
  end
end

n = 34
while n < 10_000_000
  if n % 2 != 0
    unless at_least_one_is_goldbach?(n)
      p "BINGO: #{n}"
      exit
    end
  end
  n += 1
end
