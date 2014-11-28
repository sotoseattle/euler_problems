# There are exactly ten ways of selecting three from five, 12345:

# 123, 124, 125, 134, 135, 145, 234, 235, 245, and 345

# In combinatorics, we use the notation, 5C3 = 10.

# In general, nCr = n! / r!(n−r)!, where r ≤ n, n! = n×(n−1)×...×3×2×1, and 0! = 1.
# It is not until n = 23, that a value exceeds one-million: 23C10 = 1144066.

# How many, not necessarily distinct, values of  nCr, for 1 ≤ n ≤ 100, are greater than one-million?

# we are looking for fact(n)/fact(r) >= fact(n-r). 1_000_000

def fact_n_to_r(n, r) # n!/r! => 4!/3! => 4.3.2.1 / 3.2.1 => n to r+1
  r += 1
  [*(r..n)].reduce(:*)
end

def fact_n_to_1(n)    # n!
  return 1 if n == 0
  [*(1..n)].reduce(:*)
end

def values_over_limit_for(n)
  [*(1...n)].count { |r| fact_n_to_r(n, r) >= fact_n_to_1(n - r) * 1_000_000 }
end

# p fact_n_to_r 23, 20
# p values_over_limit_for 23

p [*(1..100)].map { |n| values_over_limit_for(n) }.reduce(:+)


