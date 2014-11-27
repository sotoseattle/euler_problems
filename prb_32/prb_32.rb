# We shall say that an n-digit number is pandigital if it makes use of all the digits
# 1 to n exactly once; for example, the 5-digit number, 15234, is 1 through 5 pandigital.

# The product 7254 is unusual, as the identity, 39 × 186 = 7254, containing multiplicand,
# multiplier, and product is 1 through 9 pandigital.

# Find the sum of all products whose multiplicand/multiplier/product identity can
# be written as a 1 through 9 pandigital.

# HINT: Some products can be obtained in more than one way so be sure to only include
# it once in your sum.

sol = {}
(1...1_000).to_a.each do |a|
  (1...1_0_000).to_a.each do |b|
    c = a * b
    break if [a,b,c].map{|e| e.to_s.chars.size}.reduce(:+) > 9
    sol[[a, b]] = c if "#{a}#{b}#{c}".chars.sort.join == '123456789'
  end
end

p sol.values.uniq.reduce(:+)
