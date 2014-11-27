# The nth term of the sequence of triangle numbers is given by, tn = ½n(n+1);
# so the first ten triangle numbers are:

# 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...

# By converting each letter in a word to a number corresponding to its alphabetical
# position and adding these values we form a word value. For example, the word value
# for SKY is 19 + 11 + 25 = 55 = t10. If the word value is a triangle number then we
# shall call the word a triangle word.

# Using words.txt, a 16K text file containing nearly two-thousand common English
# words, how many are triangle words?

BASE = 'A'.ord

def triangle(n)
  n += 1
  0.5 * n * (n - 1)
end

def value(c)
  c.ord - BASE + 1
end

def word_value(w)
  w.chars.map { |c| value(c) }.reduce(:+)
end

def is_triangle_thingy?(m)
  n = 1
  loop do
    t = triangle(n)
    return false if t > m
    return true  if m == t
    n += 1
  end
  false
end

p File.open('p042_words.txt', 'r')
      .read
      .gsub("\"", '')
      .split(',')
      .count { |w| is_triangle_thingy? word_value(w) }
