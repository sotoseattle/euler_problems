# We shall say that an n-digit number is pandigital if it makes use of all the
# digits 1 to n exactly once. For example, 2143 is a 4-digit pandigital and is also prime.

# What is the largest n-digit pandigital prime that exists?
require 'prime'

def get_max_from_top
  n = 99_999_999
  while n > 1
    unless n % 2 == 0 || n % 3 == 0 || n % 5 == 0 || n % 7 == 0 || n % 11 == 0 || n % 13 == 0
      ns = n.to_s.chars
      z = ns.size
      return n if z == ns.uniq.size &&
                  ns.sort == [*(1..z)].map(&:to_s) &&
                  Prime.prime?(n)
    end
    n -= 1
  end
end

p get_max_from_top
