# ASCII string value
def ascii_value(str)
  sum = 0
  str.each_char { |char| sum += char.ord }
  sum
end

# p ascii_value('Four score') == 984
# p ascii_value('Launch School') == 1251
# p ascii_value('a') == 97
# p ascii_value('') == 0


# After midnight (part 1)
WEEK_DAYS = %w[Sunday Monday Tuesday Wednesday Thurdsay Friday Saturday]

def time_of_day(minutes)
  # normalized_minutes = minutes % (24 * 60)
  # hours = normalized_minutes / 60
  # minutes = normalized_minutes % 60
  time = Time.new(2023, 2, 19) + (minutes * 60)
  day = WEEK_DAYS[time.wday]
  hours = time.hour.to_s.rjust(2, '0')
  minutes = time.min.to_s.rjust(2, '0')
  "#{day} #{hours}:#{minutes}"
end

# p time_of_day(0)# == "00:00"
# p time_of_day(-3)# == "23:57"
# p time_of_day(35)# == "00:35"
# p time_of_day(-1437)# == "00:03"
# p time_of_day(3000)# == "02:00"
# p time_of_day(800)# == "13:20"
# p time_of_day(-4231)# == "01:29"


# After midnight (part 2)
def after_midnight(daytime)
  ((daytime[0..1].to_i % 24) * 60) + daytime[-2..].to_i
end

def before_midnight(daytime)
  -after_midnight(daytime) % (24 * 60)
end

# p after_midnight('00:00') == 0
# p before_midnight('00:00') == 0
# p after_midnight('12:34') == 754
# p before_midnight('12:34') == 686
# p after_midnight('24:00') == 0
# p before_midnight('24:00') == 0


# Letter swap
def swap(words)
  words = words.split
  words.map! do |word|
    first = word[0]
    word[0] = word[-1]
    word[-1] = first
    word
  end
  words.join(' ')
end

# p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
# p swap('Abcde') == 'ebcdA'
# p swap('a') == 'a'


# Clean up the words
def cleanup(words)
  words.gsub(/\W+/, ' ')
end

# p cleanup("---what's my +*& line?") == ' what s my line '


# Letter counter (part 1)
def word_sizes(words)
  counter = Hash.new(0)
  words.split.each do |word|
    stripped_word = word.delete('^a-zA-Z')
    counter[stripped_word.length] += 1
  end
  counter
end

# p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
# p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
# p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
# p word_sizes('') == {}


# Letter counter (part 2)
# p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
# p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
# p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
# p word_sizes('') == {}


# Alphabetical numbers
ALPHA_WORDS = %w[
  zero one two three four five six seven eight nine
  ten eleven twelve thirteen fourteen fifteen sixteen
  seventeen eighteen nineteen
]

def alphabetic_number_sort(int_arr)
  int_arr.sort do |a, b|
    ALPHA_WORDS[a] <=> ALPHA_WORDS[b]
  end
end

# p alphabetic_number_sort((0..19).to_a) == [
#   8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
#   6, 16, 10, 13, 3, 12, 2, 0
# ]


# ddaaiillyy ddoouubbllee
def crunch(str)
  crunched = ''
  str.each_char do |char|
    crunched << char unless char == crunched[-1]
  end
  crunched
  # while str[/(.)\1/]
  #   str[/(.)\1/] = str[/(.)\1/][0]
  # end
  # str
end

# p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
# p crunch('4444abcabccba') == '4abcabcba'
# p crunch('ggggggggggggggg') == 'g'
# p crunch('a') == 'a'
# p crunch('') == ''


# Spin Me Around In Circles
# def spin_me(str)
#   str.split.each do |word|
#     word.reverse!
#   end.join(" ")
# end
#
# spin_me("hello world") # "olleh dlrow"

# returns a new object


# List of digits
def digit_list(int)
  int.to_s.chars.map { |element| element.to_i }
end

# puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
# puts digit_list(7) == [7]                     # => true
# puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
# puts digit_list(444) == [4, 4, 4]             # => true
