# Rotation (part 1)
def rotate_array(arr)
  new_arr = arr.clone
  new_arr << new_arr.shift
end

# p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
# p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
# p rotate_array(['a']) == ['a']

# x = [1, 2, 3, 4]
# p rotate_array(x) == [2, 3, 4, 1]   # => true
# p x == [1, 2, 3, 4]                 # => true


# Rotation (part 2)
def rotate_rightmost_digits(int, digit_amount)
  digits = int.digits.reverse!
  digits << digits.slice!(-digit_amount)
  digits.join.to_i
end

# p rotate_rightmost_digits(735291, 1) == 735291
# p rotate_rightmost_digits(735291, 2) == 735219
# p rotate_rightmost_digits(735291, 3) == 735912
# p rotate_rightmost_digits(735291, 4) == 732915
# p rotate_rightmost_digits(735291, 5) == 752913
# p rotate_rightmost_digits(735291, 6) == 352917


# Rotation (part 3)
def max_rotation(int)
  digits = int.digits.reverse!
  (digits.size - 1).times do |i|
    digits << digits.slice!(i)
  end
  digits.join.to_i
end

# p max_rotation(735291) == 321579
# p max_rotation(3) == 3
# p max_rotation(35) == 53
# p max_rotation(105) == 15 # the leading zero gets dropped
# p max_rotation(8_703_529_146) == 7_321_609_845


# 1000 lights
# switches 1..n => off
def switch_lights(switches)
  switches_status = [1] * switches

  switches.times do |pass|
    switches_status.each_index do |status_index|
      switching = ((status_index + 1) % (2 + pass)).zero?
      switches_status[status_index] *= -1 if switching
    end
  end

  switches_on = []
  switches_status.each_with_index do |status, status_index|
    switches_on << status_index + 1 if status.positive?
  end
  switches_on
end

# p switch_lights(5) == [1, 4]
# p switch_lights(10) == [1, 4, 9]
# p switch_lights(1000) == [1, 4, 9, 16, 25, 36, 49, 64, 81, 100, 121, 144, 169, 196, 225, 256, 289, 324, 361, 400, 441, 484, 529, 576, 625, 676, 729, 784, 841, 900, 961]


# Diamonds!
def diamond(width, outline_only = false)
  lines = []
  center_index = width / 2

  width.times do |i|
    i -= (i - center_index) * 2 if i > center_index
    line = '*' * ((i * 2) + 1)
    spacing = outline_only && !i.zero?
    line = '*' << ' ' * (line.length - 2) << '*' if spacing

    lines << line.center(width)
  end

  puts lines
end

# diamond(1)
# diamond(3, true)
# diamond(19)
# diamond(9, true)


# Stack machine interpretation
def minilang(input)
  stack = []
  register = 0
  commands = input.split

  commands.each do |command|
    case command
    when 'PUSH'
      stack << register
    when 'POP'
      register = stack.pop
    when 'ADD'
      register += stack.pop
    when 'SUB'
      register -= stack.pop
    when 'MULT'
      register *= stack.pop
    when 'DIV'
      register /= stack.pop
    when 'MOD'
      register %= stack.pop
    when 'PRINT'
      puts register
    else
      register = command.to_i if command.to_i.to_s == command
    end
  end
end

# minilang('PRINT')
# # 0

# minilang('5 PUSH 3 MULT PRINT')
# # 15

# minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# # 5
# # 3
# # 8

# minilang('5 PUSH POP PRINT')
# # 5

# minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# # 5
# # 10
# # 4
# # 7

# minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# # 6

# minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# # 12

# minilang('-3 PUSH 5 SUB PRINT')
# # 8

# minilang('6 PUSH')
# # (nothing printed; no PRINT commands)


# Word to digit
NUMBER_WORDS = %w[zero one two three four five six seven eight nine]

def word_to_digit(sentence)
  10.times { |i| sentence.gsub!(NUMBER_WORDS[i], i.to_s) }
  sentence
end

# p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'


# Fibonacci numbers (recursion)
def fib_tail(n, prev1, prev2)
  if n == 1
    prev1
  elsif n == 2
    prev2
  else
    fib_tail(n - 1, prev2, prev2 + prev1)
  end
end

def fibonacci(n)
  # return 1 if n <= 2
  # fibonacci(n - 1) + fibonacci(n - 2)

  # fib_tail(n, 1, 1)

  fib = [1, 1]
  (n - 2).times do
    fib << fib[1] + fib.shift
  end
  fib[1]
end

# p fibonacci(1) == 1
# p fibonacci(2) == 1
# p fibonacci(3) == 2
# p fibonacci(4) == 3
# p fibonacci(5) == 5
# p fibonacci(12) == 144
# p fibonacci(20) == 6765
# # p fibonacci(8000)


# # Fibonacci numbers (procedural)

# p fibonacci(20) == 6765
# p fibonacci(100) == 354224848179261915075
# p fibonacci(100_001) # => 4202692702.....8285979669707537501


# Fibonacci numbers (last digit)
def fibonacci_last(nth)
  last_2 = [1, 1]
  3.upto(nth) do
    p last_2 = [last_2.last, (last_2.first + last_2.last) % 10]
  end

  last_2.last
end

# p fibonacci_last(15) == 0        # -> 0  (the 15th Fibonacci number is 610)
# p fibonacci_last(20) == 5        # -> 5 (the 20th Fibonacci number is 6765)
# p fibonacci_last(100) == 5       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
# p fibonacci_last(100_001) == 1   # -> 1 (this is a 20899 digit number)
# p fibonacci_last(1_000_007) == 3 # -> 3 (this is a 208989 digit number)
# p fibonacci_last(123456789) == 4 # -> 4
