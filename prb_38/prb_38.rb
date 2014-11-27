# Take the number 192 and multiply it by each of 1, 2, and 3:

# 192 × 1 = 192
# 192 × 2 = 384
# 192 × 3 = 576
# By concatenating each product we get the 1 to 9 pandigital, 192384576.
# We will call 192384576 the concatenated product of 192 and (1,2,3)

# The same can be achieved by starting with 9 and multiplying by 1, 2, 3, 4, and 5,
# giving the pandigital, 918273645, which is the concatenated product of 9 and (1,2,3,4,5).

# What is the largest 1 to 9 pandigital 9-digit number that can be formed as the
# concatenated product of an integer with (1,2, ... , n) where n > 1?

def pandigital?(n)
  n.to_s.chars.sort.join == '123456789'
end

max = 0
(1...100_000).to_a.each do |n|
  (1..1_000).to_a.each do |m|
    pr_s = [*(1..m)].map { |e| e*n }.join
    pr_i = pr_s.to_i
    break if pr_i > 999_999_999
    max = pr_i if pandigital?(pr_s) && pr_i > max
  end
end
p max

# 932718654
