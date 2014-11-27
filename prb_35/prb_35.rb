# The number, 197, is called a circular prime because all rotations of the digits:
# 197, 971, and 719, are themselves prime.

# There are thirteen such primes below 100:
# 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.

# How many circular primes are there below one million?
require 'prime'

def rotations(str)
  z = str.size
  carr = str.chars
  str_db = carr * 2
  carr.each_with_index.map { |e, i| str_db[i, z] }
end

sol = (1...1_000_000).to_a.select do |n|
  rotations(n.to_s).all? { |e| Prime.prime?(e.join.to_i) }
end
p sol.count
