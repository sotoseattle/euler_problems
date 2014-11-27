# The Fibonacci sequence is defined by the recurrence relation:
# Fn = Fn−1 + Fn−2, where F1 = 1 and F2 = 1.
# Hence the first 12 terms will be:
# F1 = 1
# F2 = 1
# F3 = 2
# F4 = 3
# F5 = 5
# F6 = 8
# F7 = 13
# F8 = 21
# F9 = 34
# F10 = 55
# F11 = 89
# F12 = 144

# The 12th term, F12, is the first term to contain three digits.
# What is the first term in the Fibonacci sequence to contain 1000 digits?

def fibo(n)
  return 1 if n < 3
  f_1 = f_2 = 1
  fn = 0
  (3..n).to_a.each do |e|
    fn = f_1 + f_2
    f_2, f_1 = f_1, fn
  end
  fn
end

def freaky_fibo
  f_1 = f_2 = 1
  fn = 0
  n = 3
  while
    fn = f_1 + f_2
    f_2, f_1 = f_1, fn

    return n if fn.to_s.size == 1_000
    n += 1
  end
end

p freaky_fibo
