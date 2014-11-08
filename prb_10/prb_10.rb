# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
# Find the sum of all the primes below two million.

require 'prime'

def prb_10(n)
  Prime.each(n).reduce(:+)
end

p prb_10(2_000_000)
