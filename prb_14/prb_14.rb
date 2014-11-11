# The following iterative sequence is defined for the set of positive integers:

# n → n/2 (n is even)
# n → 3n + 1 (n is odd)

# Using the rule above and starting with 13, we generate the following sequence:

# 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
# It can be seen that this sequence (starting at 13 and finishing at 1) contains
# 10 terms. Although it has not been proved yet (Collatz Problem), it is thought
# that all starting numbers finish at 1.

# Which starting number, under one million, produces the longest chain?

def collatz_chain_size(n)
  count = 1
  while n != 1
    n = (n % 2 == 0) ? n/2 : (3 * n) + 1
    count += 1
  end
  count
end

def biggest_collatz_chain(big_number)
  sol, max = 0, 0
  [*1..big_number].each do |number|
    m = collatz_chain_size(number)
    max, sol = m, number if m > max
  end
  [sol, max]
end

p biggest_collatz_chain(1_000_000)
