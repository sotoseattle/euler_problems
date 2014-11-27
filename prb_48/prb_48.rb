# The series, 11 + 22 + 33 + ... + 1010 = 10405071317.

# Find the last ten digits of the series, 11 + 22 + 33 + ... + 10001000.

def series_a(limit)
  [*(1..limit)].map { |n| n**n }.reduce(:+)
end

p series_a(1000).to_s.chars[-10..-1].join
