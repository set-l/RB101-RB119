# Searching 101
LABELS = %w[1st 2nd 3rd 4th 5th last]

def search_nums
  entries = []
  last = 0
  6.times do |i|
    puts "Enter the #{LABELS[i]} number:"
    last = gets.chomp.to_i
    entries << last unless i == 5
  end
  found = entries.include?(last) ? 'appears' : 'does not appear'
  puts "The number #{last} #{found} in #{entries}."
end

# search_nums


# Arithmetic integer
def arith
  puts '==> Enter the first number:'
  first = gets.chomp.to_i
  puts '==> Enter the second number:'
  second = gets.chomp.to_i

  puts "==> #{first} + #{second} = #{first + second}"
  puts "==> #{first} - #{second} = #{first - second}"
  puts "==> #{first} * #{second} = #{first * second}"
  puts "==> #{first} / #{second} = #{first / second}"
  puts "==> #{first} % #{second} = #{first % second}"
  puts "==> #{first} ** #{second} = #{first**second}"
end

# arith


# Counting the number of characters
def count_input
  printf 'Please write word or multiple words: '
  words = gets.chomp.strip!
  count = words.length - words.count(' ')
  puts "There are #{count} characters in \"#{words}\"."
end

# count_input


# Multiplying two numbers
def mult(a, b)
  a * b
end

# mult([1, 2, 'a', 'b'], 3)


# Squaring an argument
def power_to(n, n2)
  result = n
  (n2 - 1).times { result = mult(result, n) }
  result
end

# p power_to(3, 5)


# Exclusive or
def xor?(a, b)
  !a != !b ? true : false
end

# p xor?(5.even?, 4.even?) == true
# p xor?(5.odd?, 4.odd?) == true
# p xor?(5.odd?, 4.even?) == false
# p xor?(5.even?, 4.odd?) == false


# Palindromic strings (part 1)
def palindrome?(str)
  str == str.reverse
end

# p palindrome?([3, 4, 5, 4, 3]) == true
# p palindrome?([3, 4, 5, 3, 4]) == false
# p palindrome?('madam') == true
# p palindrome?('Madam') == false          # (case matters)
# p palindrome?("madam i'm adam") == false # (all characters matter)
# p palindrome?('356653') == true


# Palindromic strings (part 2)
def real_palindrome?(str)
  alpha_num_str = str.delete('^a-zA-Z0-9')
  palindrome?(alpha_num_str.upcase)
end

# p real_palindrome?('madam') == true
# p real_palindrome?('Madam') == true           # (case does not matter)
# p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
# p real_palindrome?('356653') == true
# p real_palindrome?('356a653') == true
# p real_palindrome?('123ab321') == false


# Palindromic numbers
def palindromic_number?(num)
  num.to_s == num.to_s.reverse
end

# p palindromic_number?(003454300) == true
# p palindromic_number?(23210) == false
# p palindromic_number?(22) == true
# p palindromic_number?(5) == true


# Uppercase check
def uppercase?(str)
  alpha_num_str = str.delete('^a-zA-Z0-9')
  alpha_num_str == alpha_num_str.upcase
end

# p uppercase?('t') == false
# p uppercase?('T') == true
# p uppercase?('Four Score') == false
# p uppercase?('FOUR SCORE') == true
# p uppercase?('4SCORE!') == true
# p uppercase?('') == true