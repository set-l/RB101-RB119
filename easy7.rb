# Combine two lists
def interleave(arr1, arr2)
  # new_arr = []
  # arr1.size.times do |i|
  #   new_arr << arr1[i] << arr2[i]
  # end
  # new_arr
  arr1.zip(arr2).flatten
end

# p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']


# Lettercase counter
def letter_case_count(str)
  {
    lowercase: str.count('a-z'),
    uppercase: str.count('A-Z'),
    neither: str.count('^a-zA-Z')
  }
end

# p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
# p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
# p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
# p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }


# Capitalize words
def word_cap(str)
  words = str.split.map! do |word| # { |word| word.capitalize }
    word.downcase!
    word[0] = word[0].upcase
    word
  end
  p words.join(' ')
end

# p word_cap('four score and seven') == 'Four Score And Seven'
# p word_cap('the javaScript language') == 'The Javascript Language'
# p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'


# Swap case
def swapcase(str)
  new_str = ''
  str.each_char do |char|
    if char.upcase == char.downcase
      new_str << char
    elsif char == char.upcase
      new_str << char.downcase
    else
      new_str << char.upcase
    end
  end
  new_str
end

# p swapcase('CamelCase') == 'cAMELcASE'
# p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'


# Staggered caps (part 1)
def staggered_case(str, start_upcase: true, ignore_non_alphas: true)
  new_str = ''
  str.each_char do |char|
    crnt_value = new_str.length
    crnt_value = new_str.count('a-zA-Z') if ignore_non_alphas
    cased = (crnt_value % 2).zero? == start_upcase ? char.upcase : char.downcase
    new_str << cased
    #   new_str << char.upcase
    # else
    #   new_str << char.downcase
    # end
  end
  new_str
end

# p staggered_case('I Love Launch School!', ignore_non_alphas: false) == 'I LoVe lAuNcH ScHoOl!'
# p staggered_case('ALL_CAPS', ignore_non_alphas: false) == 'AlL_CaPs'
# p staggered_case('ignore 77 the 444 numbers', ignore_non_alphas: false) == 'IgNoRe 77 ThE 444 NuMbErS'
# p staggered_case('ALL_CAPS', start_upcase: false, ignore_non_alphas: false) == 'aLl_cApS'


# Staggered caps (part 2)
# p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
# p staggered_case('ALL CAPS') == 'AlL cApS'
# p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'
# p staggered_case('ALL CAPS', start_upcase: false) == 'aLl CaPs'


# Multiplicative average
def show_multiplicative_average(arr)
  result = (arr.reduce(:*) / arr.length.to_f).round(3)
  puts "The result is #{format('%.3f', result)}"
end

# p show_multiplicative_average([3, 5])                # => The result is 7.500
# p show_multiplicative_average([6])                   # => The result is 6.000
# p show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667


# Multiply lists
def multiply_list(arr1, arr2)
  new_arr = []
  arr1.each_index do |i|
    new_arr << arr1[i] * arr2[i]
  end
  new_arr
end

# p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]


# Multiply all pairs
def multiply_all_pairs(arr1, arr2)
  new_arr = []
  arr1.each do |x1|
    arr2.each do |x2|
      new_arr << x1 * x2
    end
  end
  new_arr.sort!
end

# p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]


# The end is near but not here
def penultimate(str)
  str.split[-2]
end

# p penultimate('last word') == 'last'
# p penultimate('Launch School is great!') == 'is'


# How many
def count_occurrences(arr)
  counted = []
  arr.each do |x|
    puts "#{x} => #{arr.count(x)}" unless counted.include?(x)
    counted << x
  end
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]
count_occurrences(vehicles)

# car => 4
# truck => 3
# SUV => 1
# motorcycle => 2