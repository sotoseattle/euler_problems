# The decimal number, 585 = 1001001001 (binary), is palindromic in both bases.
# Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.
# (Please note that the palindromic number, in either base, may not include leading zeros.)

def palindrome?(str)
  str == str.reverse
end

a = (1...1_000_000).to_a.select { |n| palindrome?(n.to_s) && palindrome?(n.to_s(2)) }

p a.reduce(:+)
