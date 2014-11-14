def brute_force_power_digit_sum(n)
  (2**n).to_s.chars.map(&:to_i).reduce(:+)
end

p brute_force_power_digit_sum(15) == 26
p brute_force_power_digit_sum(1000) == 1366
