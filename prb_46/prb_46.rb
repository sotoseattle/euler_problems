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

def one_is_goldbach?(n)
  Prime.each(n).map.any? { |prime| Math.sqrt((n - prime)/2.0) % 1 == 0 }
end

def do_me_a_goldbach
  n = 34
  loop do
    return n unless one_is_goldbach?(n) if n.odd?
    n += 1
  end
end

p do_me_a_goldbach
