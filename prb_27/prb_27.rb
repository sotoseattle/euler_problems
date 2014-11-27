# Euler discovered the remarkable quadratic formula:

# n² + n + 41

# It turns out that the formula will produce 40 primes for the consecutive values
# n = 0 to 39. However, when n = 40, 402 + 40 + 41 = 40(40 + 1) + 41 is divisible
# by 41, and certainly when n = 41, 41² + 41 + 41 is clearly divisible by 41.

# The incredible formula  n² − 79n + 1601 was discovered, which produces 80 primes
# for the consecutive values n = 0 to 79. The product of the coefficients, −79 and
# 1601, is −126479.

# Considering quadratics of the form:

# n² + an + b, where |a| < 1000 and |b| < 1000

# where |n| is the modulus/absolute value of n
# e.g. |11| = 11 and |−4| = 4
# Find the product of the coefficients, a and b, for the quadratic expression that
# produces the maximum number of primes for consecutive values of n, starting with n = 0.
require 'prime'

def euler(a, b)
  i = 0
  (0..80).each do |n|
    if Prime.prime? (n**2 + a*n + b)
      i += 1
    else
      return i
    end
  end
  i
end

sol = 0
max = 0

(-999...1_000).each do |a|
  (-999...1_000).each do |b|
    e = euler(a, b)
    if e > max
      max = e
      sol = [a, b]
    end
  end
end

p max
p sol
p sol.reduce(:*)
