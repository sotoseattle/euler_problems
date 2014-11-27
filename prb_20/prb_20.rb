# n! means n × (n − 1) × ... × 3 × 2 × 1

# For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
# and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.

# Find the sum of the digits in the number 100!

def fact_you(n)
  return n if n == 1
  n * fact_you(n-1)
end

def freaky_sum(n)
  fact_you(n).to_s.chars.map(&:to_i).reduce(:+)
end

p freaky_sum 100
