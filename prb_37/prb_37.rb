# The number 3797 has an interesting property. Being prime itself, it is possible
# to continuously remove digits from left to right, and remain prime at each stage:
# 3797, 797, 97, and 7. Similarly we can work from right to left: 3797, 379, 37, and 3.

# Find the sum of the only eleven primes that are both truncatable from left to
# right and right to left.

# NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.
require 'prime'

def forever_prime?(n)
  na = n.to_s.chars
  na.each_with_index.map { |_e, i| na[i..-1].join.to_i     }.all? { |e| Prime.prime? e } &&
  na.each_with_index.map { |_e, i| na[0..(-1-i)].join.to_i }.all? { |e| Prime.prime? e }
end

sum = count = 0
n = 11
while count <= 10
  if Prime.prime?(n) && forever_prime?(n)
    count += 1
    sum += n
  end
  n += 1
end

p "sum __________ #{sum}"
