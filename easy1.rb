# Repeat yourself
def repeat(string, amount)
  amount.times { puts string }
end

# repeat('Hello', 3)


# Odd
def is_odd?(int)
  int.remainder(2) == 1 || int.remainder(2) == -1
end

# puts is_odd?(2) == false    # => false
# puts is_odd?(5) == true    # => true
# puts is_odd?(-17) == true  # => true
# puts is_odd?(-8) == false   # => false
# puts is_odd?(0) == false    # => false
# puts is_odd?(7) == true   # => true


# Stringy strings
def stringy(length, starting_char = 1)
  new_string = ''
  length.times do |i|
    i += 1 if starting_char == 1
    new_string << (i % 2).to_s
  end
  new_string
end

# puts stringy(6) == '101010'
# puts stringy(9) == '101010101'
# puts stringy(4) == '1010'
# puts stringy(7) == '1010101'
# puts stringy(5, 0) == '01010'
# puts stringy(7, 0) == '0101010'


# What's my bonus?
def calculate_bonus(salary_int, is_applicable)
  is_applicable ? salary_int / 2 : 0
end

# puts calculate_bonus(2800, true) == 1400
# puts calculate_bonus(1000, false) == 0
# puts calculate_bonus(50000, true) == 25000


# Bannerizer
BOX_H = '+--+'.freeze
BOX_V = '|  |'.freeze
MAX_COLS = 80 - BOX_H.length

def construct_box(part_above, part_below, box_size)
  [part_above, part_below].each do |box_part|
    filler_parts = box_part[1] * box_size
    puts box_part.insert(box_part.size / 2, filler_parts)
  end
end

def fill_box(message, box_size)
  until message.empty?
    wrap_index_or_nil = message.index("\n")
    is_wrap_invalid = !wrap_index_or_nil || wrap_index_or_nil > MAX_COLS
    is_wrap_invalid &= message.length > MAX_COLS
    wrap_index_or_nil = message.rindex(' ', MAX_COLS) if is_wrap_invalid

    message.slice!(MAX_COLS..-1) unless wrap_index_or_nil
    single_line = message.slice!(0..wrap_index_or_nil || MAX_COLS)
    # Right whitespace at max length takes up a box whitespace. Left whitespace is preference
    single_line = single_line.strip.ljust(box_size)

    puts (+BOX_V).insert(BOX_V.size / 2, single_line)
  end
end

def print_in_box(message)
  column_amount = [message.length, MAX_COLS].min

  construct_box(+BOX_H, +BOX_V, column_amount)
  if message.empty?
    puts (+BOX_V).insert(BOX_V.size / 2, ' ' * column_amount)
  else
    fill_box(message, column_amount)
  end
  construct_box(+BOX_V, +BOX_H, column_amount)
end

# print_in_box('This is a short sentence.')
# print_in_box('')
# print_in_box('This is a sentence that will have it\'s whitespaces removed in order to'\
#              'test truncating messages that I do not want to wrap.'.split.join)
# print_in_box("This is a#{' very' * 41} long sentence.")
# print_in_box("This is an extra test for: \n strings \n\n \n containing\nnewlines ")


# Right triangles
CORNERS = [1, 2, 3, 4].freeze

# 1   2
#  ***
#  ***
#  ***
# 3   4
def triangle(size, corner = 1)
  return unless CORNERS.include?(corner)

  size.times do |i|
    line = [1, 2].include?(corner) ? '*' * (size - i) : '*' * (i + 1)
    line = [1, 3].include?(corner) ? line.ljust(size) : line.rjust(size)

    puts line
  end
end

# CORNERS.each { |c| triangle((2..11).to_a.sample, c) }


# Madlibs
BLANKS = %w[noun verb adjective adverb]
INCOMPLETE_SENTENCES = [
  "Do you verb your adjective noun adverb? That's hilarious!",
  "The adjective noun verbs adverb over the lazy dog.",
  "The noun adverb verbs up adjective Joe's turtle."
]

def madlibs
  my_sentences = INCOMPLETE_SENTENCES.map(&:dup)

  BLANKS.each do |category|
    printf "Enter a #{category}: "
    entry = gets.chomp
    my_sentences.each { |sentence| sentence.sub!(category, entry) }
  end

  puts "\n", my_sentences
end

# madlibs


# Reverse the digits in a number
def reversed_number(num)
  num.to_s.reverse!.to_i
end

# p reversed_number(12345) == 54321
# p reversed_number(12213) == 31221
# p reversed_number(456) == 654
# p reversed_number(12000) == 21 # No leading zeros in return value!
# p reversed_number(12003) == 30021
# p reversed_number(1) == 1


# Get middle character
def center_of(str)
  middle_index = str.length / 2.0
  if middle_index == middle_index.round
    str[middle_index - 1, 2]
  else
    str[middle_index]
  end
end

# p center_of('I love ruby') == 'e'
# p center_of('Launch School') == ' '
# p center_of('Launch') == 'un'
# p center_of('Launchschool') == 'hs'
# p center_of('x') == 'x'

