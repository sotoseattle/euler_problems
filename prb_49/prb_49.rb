# The arithmetic sequence, 1487, 4817, 8147, in which each of the terms increases
# by 3330, is unusual in two ways: (i) each of the three terms are prime, and,
# (ii) each of the 4-digit numbers are permutations of one another.

# There are no arithmetic sequences made up of three 1-, 2-, or 3-digit primes,
# exhibiting this property, but there is one other 4-digit increasing sequence.

# What 12-digit number do you form by concatenating the three terms in this sequence?
require 'prime'

b = [*(0..9) ].repeated_permutation(4)
              .map { |a| a.join.to_i }
              .select { |n| Prime.prime? n }
              .combination(3)
              .select { |c| c[1] - c[0] == c[2] - c[1] &&
                            c.all?{ |e| e > 1_000 }    &&
                            c.map{ |e| e.to_s.chars.sort }.uniq.size == 1}

p b
