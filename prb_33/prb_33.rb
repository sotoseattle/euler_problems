# The fraction 49/98 is a curious fraction, as an inexperienced mathematician in
# attempting to simplify it may incorrectly believe that 49/98 = 4/8, which is correct,
# is obtained by cancelling the 9s.

# We shall consider fractions like, 30/50 = 3/5, to be trivial examples.

# There are exactly four non-trivial examples of this type of fraction, less than
# one in value, and containing two digits in the numerator and denominator.

# If the product of these four fractions is given in its lowest common terms,
# find the value of the denominator.

def s(n)
  n.to_s.chars.join
end

def i(sarr)
  sarr.to_i
end

def find_the_four
  sol = []
  (10..99).to_a.each do |n|
    sn = s(n)
    (n..99).to_a.each do |m|
      sm = s(m)
      if n != m && sn[1]!="0"
        if (sn.include?(sm[0]) && n * i(sm[1]) == i(sn.sub(sm[0], '')) * m) ||
           (sn.include?(sm[1]) && n * i(sm[0]) == i(sn.sub(sm[1], '')) * m)
          sol << [n, m]
        end
      end
    end
  end
  sol
end

f = find_the_four

num, den = 1, 1
f.each do |a,b|
  num *= a
  den *= b
end

p den/num

