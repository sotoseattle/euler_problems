# Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
# If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable pair and each
# of a and b are called amicable numbers.
#
# For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110;
# therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.
# Evaluate the sum of all the amicable numbers under 10_000.
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

h = {}
(2...10_000).each { |n| h[n] = d(n) }

a = h.map { |k, v| k if h[v] == k && k != v }.compact.uniq

# [6, 28, 220, 284, 496, 1184, 1210, 2620, 2924, 5020, 5564, 6232, 6368, 8128]
# [220, 284, 1184, 1210, 2620, 2924, 5020, 5564, 6232, 6368]
# a.each do |e|
#   puts "#{e}: #{h[e]}"
# end

p a.reduce(:+)
