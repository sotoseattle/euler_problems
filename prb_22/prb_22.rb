# Using names.txt (right click and 'Save Link/Target As...'), a 46K text file
# containing over five-thousand first names, begin by sorting it into alphabetical order.
# Then working out the alphabetical value for each name, multiply this value by its
# alphabetical position in the list to obtain a name score.

# For example, when the list is sorted into alphabetical order, COLIN, which is
# worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN would
# obtain a score of 938 × 53 = 49714.

# What is the total of all the name scores in the file?

names = File.open('./p022_names.txt', 'r').read.gsub("\"", '').split(',')

BASE = 'A'.ord - 1

def value(name)
  name.chars.map { |c| c.ord - BASE }.reduce(:+)
end

p names.sort.each_with_index.map { |name, i| value(name) * (i + 1) }.reduce(:+)

# 871198282
