# If the numbers 1 to 5 are written out in words: one, two, three, four, five,
# then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

# If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words,
# how many letters would be used?

# NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two)
# contains 23 letters and 115 (one hundred and fifteen) contains 20 letters.
# The use of "and" when writing out numbers is in compliance with British usage.

class Translator
  def initialize
    @dictio = {}
    numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 30, 40, 50, 60 , 70, 80, 90]
    words   = %w[one two three four five six seven eight nine ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen twenty thirty forty fifty sixty seventy eighty ninety]
    numbers.zip(words).each { |k,v| @dictio[k.to_s] = v }
  end

  def eng(number)
    ns = number.to_i.to_s
    return @dictio[ns] if @dictio[ns]

    lead, remainder = ns[0], ns[1..-1]
    case ns.size
    when 2
      @dictio["#{lead}0"] + ' ' + eng(remainder)
    when 3
      "#{@dictio[lead]} hundred" + (remainder == "00" ? '' : " and #{eng(remainder)}")
    end
  end

  def count(stuff)
    return eng(stuff).gsub(" ", "").size if stuff.is_a? Fixnum
    return stuff.map { |n| eng(n).gsub(' ', '').size }.reduce(:+) if stuff.is_a? Range
    nil
  end
end
