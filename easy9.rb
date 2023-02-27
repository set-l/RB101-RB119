# Welcome stranger
def greetings(name_arr, info_hash)
  full_name = name_arr.join(' ')
  title = "#{info_hash[:title]} #{info_hash[:occupation]}"
  "Hello, #{full_name}! Nice to have a #{title} around."
end

# p greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' }) == "Hello, John Q Doe! Nice to have a Master Plumber around."


# Double doubles
def twice(int)
  num_str = int.to_s
  even_digits = (num_str.length % 2).zero?
  half = num_str.length / 2
  is_double = num_str[0..(half - 1)] == num_str[half..]
  even_digits && is_double ? int : int * 2
end

# p twice(37) == 74
# p twice(44) == 44
# p twice(334433) == 668866
# p twice(444) == 888
# p twice(107) == 214
# p twice(103103) == 103103
# p twice(3333) == 3333
# p twice(7676) == 7676
# p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
# p twice(5) == 10


# Counting up
def sequence(int)
  sign = int <=> 0
  ([int, 1].min..[sign, int].max).to_a
end

# p sequence(5) == [1, 2, 3, 4, 5]
# p sequence(3) == [1, 2, 3]
# p sequence(1) == [1]
# p sequence(-1) == [-1]
# p sequence(-3) == [-3, -2, -1]
# p sequence(0) == [0]


# How long are you?
def word_lengths(words)
  words.split.map { |word| "#{word} #{word.length}" }
end

# p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

# p word_lengths("baseball hot dogs and apple pie") ==
#   ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

# p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

# p word_lengths("Supercalifragilisticexpialidocious") ==
#   ["Supercalifragilisticexpialidocious 34"]

# p word_lengths("") == []


# Name swapping
def swap_name(name)
  name.split.reverse.join(', ')
end

# p swap_name('Joe Roberts') == 'Roberts, Joe'


# Sequence count
def sequence2(count, start)
  seq = []
  count.times { |i| seq << start * (i + 1) }
  seq
end

# p sequence2(5, 1) == [1, 2, 3, 4, 5]
# p sequence2(4, -7) == [-7, -14, -21, -28]
# p sequence2(3, 0) == [0, 0, 0]
# p sequence2(0, 1000000) == []


# Grade book
BEST_GRADE_MIN_SCORE = 100
GRADES = %w[A+ A B C D F]

def get_grade(*scores)
  average_score = scores.sum / scores.size

  GRADES.bsearch do |grade|
    min_score = BEST_GRADE_MIN_SCORE - (10 * GRADES.index(grade))
    average_score >= min_score || grade == 'F'
  end
end

# p get_grade(95, 90, 93) == "A"
# p get_grade(75, 75, 70)
# p get_grade(0, 0, 0) == "F"
# p get_grade(110, 110, 112) == "A+"
# p get_grade(109, 109, 109) == "A+"


# Grocery list
def buy_fruit(fruits_counts_arr)
  new_arr = fruits_counts_arr.map do |fruit_count|
    Array.new(fruit_count[1], fruit_count[0])
  end
  new_arr.flatten!
end

# p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
#   ["apples", "apples", "apples", "orange", "bananas","bananas"]


# Group anagrams
def anagrams(words)
  existing_anagrams = []
  words.each do |word|
    next if existing_anagrams.flatten.include?(word)

    word_chars = word.chars.sort
    existing_anagrams << words.select { |word2| word_chars == word2.chars.sort }
  end
  existing_anagrams.each { |group| p group }
end

# words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
#   'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
#   'flow', 'neon']
# anagrams(words)
# ["demo", "dome", "mode"]
# ["neon", "none"]
# #(etc)


# Sum of digits
def sum(n)
  n.digits.sum
end

# puts sum(23) == 5
# puts sum(496) == 19
# puts sum(123_456_789) == 45


# Odd lists
def oddities(arr)
  arr.select { |x| (arr.index(x) % 2).zero? }
end

def evenities(arr)
  arr.select { |x| (arr.index(x) % 2).positive? }
end

# p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
# p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
# p oddities(['abc', 'def']) == ['abc']
# p oddities([123]) == [123]
# p oddities([]) == []
# p oddities([1, 2, 3, 4, 1]) == [1, 3, 1]
# p evenities([4, 5, 6, 7, 8]) == [5, 7]
