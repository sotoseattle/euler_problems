# If p is the perimeter of a right angle triangle with integral length sides,
# {a,b,c}, there are exactly three solutions for p = 120.

# {20,48,52}, {24,45,51}, {30,40,50}

# For which value of p ≤ 1000, is the number of solutions maximised?

def number_solutions_for_perimeter(n)
  counter = 0
  (1..n).to_a.each do |a|
    (1..n).to_a.each do |b|
      peri = a + b + Math.sqrt(a**2 + b**2)
      break if peri > n
      counter += 1 if peri == n
    end
  end
  counter
end

sol = max = 0
(1..1_000).to_a.each do |peri|
  x = number_solutions_for_perimeter(peri)
  if x > max
    max = x
    sol = peri
  end
end
p sol
