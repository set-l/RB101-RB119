# Sum of sums
def sum_of_sums(arr)
  sum = 0
  arr.each_index { |i| sum += arr[0..i].sum }
  sum
end

# p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
# p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
# p sum_of_sums([4]) == 4
# p sum_of_sums([1, 2, 3, 4, 5]) == 35


# Leading substrings
def leading_substrings(str)
  leads = []
  str.length.times { |i| leads << str[0..i] }
  leads
end

# p leading_substrings('abc') == ['a', 'ab', 'abc']
# p leading_substrings('a') == ['a']
# p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']


# All substrings
def substrings(str)
  subs = []
  str.length.times do |i|
    (i..(str.length - 1)).to_a.each do |i2|
      subs << str[i..i2]
    end
  end
  subs
end

# p substrings('abcde') == [
#   'a', 'ab', 'abc', 'abcd', 'abcde',
#   'b', 'bc', 'bcd', 'bcde',
#   'c', 'cd', 'cde',
#   'd', 'de',
#   'e'
# ]


# Palindromic substrings
def palindromes(str)
  substrings(str).select do |x|
    x.length > 1 && x == x.reverse
  end
end

# p palindromes('abcd') == []
# p palindromes('madam') == ['madam', 'ada']
# p palindromes('hello-madam-did-madam-goodbye') == [
#   'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
#   'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
#   '-madam-', 'madam', 'ada', 'oo'
# ]
# p palindromes('knitting cassettes') == [
#   'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
# ]


# fizzbuzz
def fizzbuzz(start, ending)
  fizzbuzzed = (start..ending).to_a.map do |n|
    if (n % 3).zero? && (n % 5).zero?
      'FizzBuzz'
    elsif (n % 3).zero?
      'Fizz'
    elsif (n % 5).zero?
      'Buzz'
    else
      n
    end
  end
  puts fizzbuzzed
end

# p fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz


# Double char (part 1)
def repeater(str)
  str.chars.zip(str.chars).join
end

# p repeater('Hello') == "HHeelllloo"
# p repeater("Good job!") == "GGoooodd  jjoobb!!"
# p repeater('') == ''


# Double char (part 2)
def double_consonants(str)
  new_str = ''
  str.each_char do |char|
    if char.match(/[a-zA-Z]/) && char.match(/[^aeiou]/)
      new_str << char * 2
    else
      new_str << char
    end
  end
  new_str
end

# p double_consonants('String') == "SSttrrinngg"
# p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
# p double_consonants("July 4th") == "JJullyy 4tthh"
# p double_consonants('') == ""


# Reverse it (part 1)
def reverse_sentence(sent)
  sent.split.reverse.join(' ')
end

# puts reverse_sentence('Hello World') == 'World Hello'
# puts reverse_sentence('Reverse these words') == 'words these Reverse'
# puts reverse_sentence('') == ''
# puts reverse_sentence('    ') == '' # Any number of spaces results in ''


# Reverse it (part 2)
def reverse_words(words)
  mapped = words.split.map do |word|
    word.length >= 5 ? word.reverse : word
  end
  p mapped.join(' ')
end

# puts reverse_words('Professional') == 'lanoisseforP'          # => lanoisseforP
# puts reverse_words('Walk around the block') == 'Walk dnuora the kcolb' # => Walk dnuora the kcolb
# puts reverse_words('Launch School') == 'hcnuaL loohcS'         # => hcnuaL loohcS


# Array average
def average(arr)
  arr.reduce(:+) / arr.size.to_f
end

# puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
# puts average([1, 5, 87, 45, 8, 8]) == 25
# puts average([9, 47, 23, 95, 16, 52]) == 40
