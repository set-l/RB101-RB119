# Longest sentence
def longest_sentence(file)
  file_text = File.read(file)
  paragraphs = file_text.split("\n\n")
  sentences = file_text.split(/[.!?]/)
  words = file_text.gsub(/[.!?,]/, '').split

  { 'paragraph': paragraphs, 'sentence': sentences, 'word': words }.each do |name, value|
    longest = value.max { |a, b| a.length <=> b.length }
    count = name.to_s == 'word' ? longest.length : longest.split.length

    if name.to_s == 'sentence'
      punctuation_i = file_text.index(longest) + longest.length
      longest << file_text[punctuation_i]
    end

    puts "Longest #{name} (#{count}):\n#{longest}\n\n"
  end
end

# longest_sentence('sentences.txt')


# Now I know my ABCs
ABC_BLOCKS = %w[
  B:O X:K D:Q C:P N:A G:T R:E
  F:S J:W H:U V:I L:Y Z:M
]

def block_word?(word)
  my_blocks = ABC_BLOCKS.dup

  word.each_char do |char|
    rejected = my_blocks.reject! do |block|
      block.include?(char.upcase)
    end

    return false unless rejected
  end

  true
end

# p block_word?('BATCH') == true
# p block_word?('BUTCH') == false
# p block_word?('jest') == true


# Lettercase Percentage Ratio
def letter_percentages(letters)
  amounts = { lowercase: 0, uppercase: 0, neither: 0 }

  letters.each_char do |char|
    category = :lowercase
    if char.downcase == char.upcase
      category = :neither
    elsif char.upcase == char
      category = :uppercase
    end
    amounts[category] += 1
  end

  amounts.each_pair do |category, amount|
    amounts[category] = ((amount / letters.length.to_f) * 100).round(1)
  end
end

# p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
# p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
# p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }
# p letter_percentages("abcdefGHI") == {:lowercase=>66.7, :uppercase=>33.3, :neither=>0.0}


# Matching parentheses?
def balanced?(string)
  amounts = { '()': 0, '[]': 0, '{}': 0, '""': 0, "''": 0 }

  string.each_char do |char|
    amounts.each_key do |key|
      next unless key.to_s.include?(char)

      value = 1
      value = -1 if [')', ']', '}'].include?(char)
      value = -1 if ['"', "'"].include?(char) && amounts[key].positive?
      amounts[key] += value

      return false if amounts[key].negative?
    end
  end

  amounts.each_value { |v| return false unless v.zero? }
  true
end

# p balanced?('What is) this?') == false
# p balanced?('What (is this?') == false
# p balanced?('((What) (is this))?') == true
# p balanced?('What (is) this?') == true
# p balanced?('((What)) (is this))?') == false
# p balanced?('Hey!') == true
# p balanced?(')Hey!(') == false
# p balanced?('What ((is))) up(') == false
# p balanced?('') == true
# p balanced?("[{;lk;'''''}]") == false
# p balanced?("]()[]{}''\"\"\"\"[") == false
# p balanced?("}{}") == false
# p balanced?("\"\"\"'''") == false


# Triangle sides
def triangle(*sides)
  if sides.include?(0) || sides.min(2).sum <= sides.max
    :invalid
  elsif sides.uniq.size == 1
    :equilateral
  elsif sides.uniq.size == 2
    :isosceles
  else
    :scalene
  end
end

# p triangle(3, 3, 3) == :equilateral
# p triangle(3, 3, 1.5) == :isosceles
# p triangle(3, 4, 5) == :scalene
# p triangle(0, 3, 3) == :invalid
# p triangle(3, 1, 1) == :invalid


# Tri-Angles
def tri_angle(*sides)
  if sides.include?(0) || sides.sum != 180
    :invalid
  elsif sides.include?(90)
    :right
  elsif sides.max > 90
    :obtuse
  else
    :acute
  end
end

# p tri_angle(60, 70, 50) == :acute
# p tri_angle(30, 90, 60) == :right
# p tri_angle(120, 50, 10) == :obtuse
# p tri_angle(0, 90, 90) == :invalid
# p tri_angle(50, 50, 50) == :invalid


# Unlucky days
require 'date'
def friday_13th(year)
  start = Date.new(year, 1, 13)
  count = 0

  12.times do
    count += 1 if start.friday?
    start = start >> 1
  end
  count
end

# p friday_13th(2015) == 3
# p friday_13th(1986) == 1
# p friday_13th(2019) == 2


# Next Featured Number Higher than a Given Value
def featured(n)
  1.step do |i|
    seventh = ((n / 7) + i) * 7
    unique = seventh.digits.uniq.length == seventh.digits.length
    return seventh if seventh.odd? && unique
    return if seventh >= 9_876_543_210
  end
end

# p featured(12) == 21
# p featured(20) == 21
# p featured(21) == 35
# p featured(997) == 1029
# p featured(1029) == 1043
# p featured(999_999) == 1_023_547
# p featured(999_999_987) == 1_023_456_987

# p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements


# Bubble sort
def bubble_sort!(arr)
  arr_length = arr.length
  loop do
    new_length = 0

    1.step(to: arr_length - 1) do |i|
      if arr[i - 1] > arr[i]
        arr[i - 1], arr[i] = arr[i], arr[i - 1]
        new_length = i
      end
    end
    arr_length = new_length

    break if arr_length <= 1
  end
end

# array = [5, 3]
# bubble_sort!(array)
# p array == [3, 5]

# array = [6, 2, 7, 1, 4]
# bubble_sort!(array)
# p array == [1, 2, 4, 6, 7]

# array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
# bubble_sort!(array)
# p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)


# Sum Square - Square Sum
def sum_square_difference(n)
  n_arr = (1..n).to_a
  sum_square = n_arr.sum**2
  square_sum = n_arr.map { |i| i**2 }.sum
  sum_square - square_sum
end

# p sum_square_difference(3) == 22
#    # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
# p sum_square_difference(10) == 2640
# p sum_square_difference(1) == 0
# p sum_square_difference(100) == 25164150
