# A perfect number is a number for which the sum of its proper divisors is exactly
# equal to the number. For example, the sum of the proper divisors of 28 would be
# 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.

# A number n is called deficient if the sum of its proper divisors is less than n
# and it is called abundant if this sum exceeds n.

# As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest
# number that can be written as the sum of two abundant numbers is 24.
# By mathematical analysis, it can be shown that all integers greater than 28123
# can be written as the sum of two abundant numbers. However, this upper limit cannot
# be reduced any further by analysis even though it is known that the greatest number
# that cannot be expressed as the sum of two abundant numbers is less than this limit.

# Find the sum of all the positive integers which cannot be written as the sum of
# two abundant numbers.

require 'prime'

module Problem12  # relying heavily on Pb 12 !!!!!!!!!!
  def find_all_prime_factors_of(n)
    primes = [1] + n.prime_division.map { |a, b| [a]*b }
    primes.flatten
  end

  def combination_of_factors(factors, how_many)
    factors.combination(how_many).to_a.map { |a| a.reduce(:*) }
  end

  def all_possible_factors(n)
    primes = find_all_prime_factors_of(n)
    (1..primes.size)
      .map { |n| combination_of_factors(primes, n) }
      .flatten
      .uniq
      .sort
  end
end
include Problem12

def proper_divisors(n)
  all_possible_factors(n)[0..-2]
end

def d(n)
  proper_divisors(n).reduce(:+)
end

def abundants(n)
  h = {}
  (2..n).each { |n| h[n] = d(n) }
  deficient, perfect, abundant = [], [], []
  h.keys.select { |k| h[k] > k }
end

limit = 28_123
universe = (1..limit).to_a

a1 = abundants(limit)
abundants_sums1 = a1.combination(2).map { |a, b| a + b }.sort.uniq # sums of abundant numbers
abundants_sums2 = a1.map { |a| a + a }  # sums of the same abundant number

p (universe - abundants_sums1 - abundants_sums2).reduce(:+)

# 4179871
