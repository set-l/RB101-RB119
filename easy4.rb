# Short long short
def short_long_short(a, b)
  shorter = a
  longer = b
  if a.length > b.length
    shorter = b
    longer = a
  end

  "#{shorter}#{longer}#{shorter}"
end

# p short_long_short('abc', 'defgh') == "abcdefghabc"
# p short_long_short('abcde', 'fgh') == "fghabcdefgh"
# p short_long_short('', 'xyz') == "xyz"


# What century is that?
ENDS = %w[st nd rd th]

def century(year)
  century_num = (year / 100.0).ceil.to_i
  century_str = century_num.to_s
  num_end = century_str[-1].to_i

  is_end_needed = !num_end.zero? && num_end < ENDS.length
  is_execption = century_str[-2..] == "1#{num_end}"
  ending = is_end_needed && !is_execption ? ENDS[num_end - 1] : 'th'

  century_str << ending
end

# p century(2000) == '20th'
# p century(2001) == '21st'
# p century(1965) == '20th'
# p century(256) == '3rd'
# p century(5) == '1st'
# p century(10103) == '102nd'
# p century(1052) == '11th'
# p century(1127) == '12th'
# p century(11201) == '113th'


# Leap years (part 1/2)
require 'date'

def leap_year?(year)
  return if year <= 0

  year >= 1752 ? Date.gregorian_leap?(year) : Date.julian_leap?(year)
end
  # if (year % 4).zero?
  #   if (year % 100).zero?
  #     if (year % 400).zero?
  #       true
  #     else
  #       false
  #     end
  #   else
  #     true
  #   end
  # else
  #   false
  # end
# end

# p leap_year?(2016) == true
# p leap_year?(2015) == false
# p leap_year?(2100) == false
# p leap_year?(2400) == true
# p leap_year?(240000) == true
# p leap_year?(240001) == false
# p leap_year?(2000) == true
# p leap_year?(1900) == false
# p leap_year?(1752) == true
# p leap_year?(1700) == false
# p leap_year?(1) == false
# p leap_year?(100) == false
# p leap_year?(400) == true
# Part(2)
# p leap_year?(2016) == true
# p leap_year?(2015) == false
# p leap_year?(2100) == false
# p leap_year?(2400) == true
# p leap_year?(240000) == true
# p leap_year?(240001) == false
# p leap_year?(2000) == true
# p leap_year?(1900) == false
# p leap_year?(1752) == true
# p leap_year?(1700) == true
# p leap_year?(1) == false
# p leap_year?(100) == true
# p leap_year?(400) == true


# Multiples of 3 and 5
def multisum(upto)
  (3..upto).inject do |sum, n|
    if (n % 3).zero? || (n % 5).zero?
      sum + n
    else
      sum
    end
  end
  # sum = 0
  # 1.step(to: n) { |i| sum += i if (i % 3).zero? || (i % 5).zero? }
  # sum
end

# p multisum(3) == 3
# p multisum(5) == 8
# p multisum(10) == 33
# p multisum(1000) == 234168


# Running totals
def running_total(arr)
  new_arr = arr.empty? ? [] : [arr.first]
  arr.reduce do |sum, n|
    new_arr << sum + n
    sum + n
  end
  new_arr
end

# p running_total([2, 5, 13]) == [2, 7, 20]
# p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
# p running_total([3]) == [3]
# p running_total([]) == []


# Convert a string to a number
STR_TO_INT = {
  '1': 1, '2': 2, '3': 3, '4': 4, '5': 5,
  '6': 6, '7': 7, '8': 8, '9': 9, '0': 0
}
def string_to_integer(str)
  num = 0
  i = 0
  str.reverse.each_char do |char|
    num += 10**i * STR_TO_INT[char.to_sym]
    i += 1
  end
  num
end

# p string_to_integer('50321') == 50321
# p string_to_integer('570') == 570
# p string_to_integer('910000019') == 910000019


# Convert a string to a signed number
def string_to_signed_integer(str)
  sign = str.slice!(/[+-]/)
  num = string_to_integer(str)
  num *= -1 if sign == '-'
  num
end

# p string_to_signed_integer('4321') == 4321
# p string_to_signed_integer('-570') == -570
# p string_to_signed_integer('+100') == 100


# Convert a number to a string
INT_TO_STR = %w[0 1 2 3 4 5 6 7 8 9]
def integer_to_string(int)
  nums = int.digits.reverse
  str = ''
  nums.each { |n| str << INT_TO_STR[n] }
  str
end

# p integer_to_string(4321) == '4321'
# p integer_to_string(0) == '0'
# p integer_to_string(5000) == '5000'


# Convert a signed number to a string
def signed_integer_to_string(int)
  str = integer_to_string(int.abs)
  sign = int.negative? ? '-' : '+'
  sign = '' if int.zero?
  str.prepend(sign)
end

# p signed_integer_to_string(4321) == '+4321'
# p signed_integer_to_string(-123) == '-123'
# p signed_integer_to_string(0) == '0'
