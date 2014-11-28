# The prime 41, can be written as the sum of six consecutive primes:

# 41 = 2 + 3 + 5 + 7 + 11 + 13
# This is the longest sum of consecutive primes that adds to a prime below one-hundred.

# The longest sum of consecutive primes below one-thousand that adds to a prime,
# contains 21 terms, and is equal to 953.

# Which prime, below one-million, can be written as the sum of the most consecutive primes?
require 'prime'

def above_limit?(t)
  t >= 1_000_000
end

def find_longest_seq(arr)
  ma = 1
  pr = t = 0
  counter = 1
  arr.each do |e|
    t += e
    break if above_limit?(t)
    ma, pr = counter, t if Prime.prime?(t)
    counter += 1
  end
  [ma, pr]
end

enum = Prime.each(100_000).to_a

sol = max = 0
until enum.empty?
  ma, pr = find_longest_seq(enum)
  max, sol = ma, pr if ma > max
  enum.shift
end

p sol
p max
# p find_longest_seq(enum, 1000)
