# A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
# a^2 + b^2 = c^2
# For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.

def prb_9
  (1...1000).each do |a|
    (1...1000).each do |b|
      c = Math.sqrt(a**2 + b**2)
      return "#{a} x #{b} x #{c} = #{a*b*c}" if (a + b + c == 1000.0)
    end
  end
end

p prb_9
