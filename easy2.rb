# How old is Teddy?
def age
  puts 'What is your name?'
  name = gets.chomp
  name = 'Teddy' if name.strip == ''
  puts "#{name} is #{rand(20..200)} years old!"
end

# age


# How big is the room?
SQ_INCH_IN_FT = 144
SQ_CM_IN_FT = 929.0304

def how_big
  puts 'Enter the length of the room in feet:'
  length = gets.chomp.to_f
  puts 'Enter the width of the room in feet:'
  width = gets.chomp.to_f
  area_ft = length * width
  area_in = (area_ft * SQ_INCH_IN_FT).round(2)
  area_cm = (area_ft * SQ_CM_IN_FT).round(2)
  puts "The area of the room is #{area_ft} square feet."
  puts "(#{area_in} square inches)."
  puts "(#{area_cm} square centimeters)."
end

# how_big


# Tip calculator
def calculate_tip
  printf 'What is the bill? '
  bill = gets.chomp.to_f
  printf 'What is the tip percentage? '
  tip_percent = gets.chomp.to_f / 100

  tip = (bill * tip_percent).round(2)
  total = (bill + tip).round(2)
  puts "The tip is $#{format('%.2f', tip)}"
  puts "The total is $#{format('%.2f', total)}"
end

# calculate_tip


# When will I retire?
def retire
  printf 'What is your age? '
  age = gets.chomp.to_i
  printf 'At what age would you like to retire? '
  age_retiring = gets.chomp.to_i

  current_year = Time.now.year
  retiring_year = current_year + (age_retiring - age)
  puts "\n", "It's #{current_year}. You will retire in #{retiring_year}"
  puts "You have only #{age_retiring - age} years of work to go!"
end

# retire


# Greeting a user
def greet
  printf 'What is your name? '
  name = gets.chomp
  if name.end_with?('!')
    puts "HELLO #{name.chop.upcase}! WHY ARE WE SCREAMING?"
  else
    puts "Hello #{name}."
  end
end

# greet


# Odd numbers
def odd_nums
  1.step(by: 2, to: 99) { |i| puts i }
  99.times { |i| puts i + 1 if (i + 1).odd? }
end

# odd_nums


# Even numbers
def even_nums
  99.times { |i| puts i + 1 if (i + 1).even? }
end

# even_nums


# Sum or Product of consecutive integers
def consec_ints
  puts 'Please enter an integer greater than 0:'
  int = gets.chomp.to_i
  puts "Enter 's' to compute the sum, 'p' to compute the product."
  compute = gets.chomp[0].downcase

  if compute == 's'
    sum = (1..int).reduce(:+)
    puts "The sum of the integers between 1 and #{int} is #{sum}"
  elsif compute == 'p'
    product = (1..int).reduce(:*)
    puts "The product of the integers between 1 and #{int} is #{product}"
  end
end

# consec_ints


# String Assignment
# name = 'Bob'
# save_name = name
# name.upcase!
# puts name, save_name

# Since name and save_name point the the same object,
# modifying it changes both variables' values


# Always return negative
def to_negative(int)
  -int.abs
end

# p to_negative(5) == -5
# p to_negative(-3) == -3
# p to_negative(0) == 0


