# You are given the following information, but you may prefer to do some research
# for yourself.
#
# 1 Jan 1900 was a Monday.
# Thirty days has September,
# April, June and November.
# All the rest have thirty-one,
# Saving February alone,
# Which has twenty-eight, rain or shine.
# And on leap years, twenty-nine.
# A leap year occurs on any year evenly divisible by 4, but not on a century
# unless it is divisible by 400.
# How many Sundays fell on the first of the month during the twentieth century
# (1 Jan 1901 to 31 Dec 2000)?


Months = {Jan: 31, Feb: 28, Mar: 31, Apr: 30, May: 31, Jun: 30, Jul: 31, Aug: 31,
       Sep: 30, Oct: 31, Nov: 30, Dec: 31}

Base_Year_Days = Months.values.reduce(:+)

Days = %w[Monday Tuesday Wednesday Thursday Friday Saturday Sunday]

def is_leap_year?(year)
  year % 4.0 == 0.0 || year == 2000
end

month_starts_sunday = 0
days = 3
(1900..2000).each do |year|
  Months.each do |month, days_of_month|
    days += days_of_month
    days += 1 if month == 'Feb' && is_leap_year?(year)
    month_starts_sunday += 1 if (Days[(days % 7)] == 'Sunday' && year > 1900)
  end
end
p month_starts_sunday
