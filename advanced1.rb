require 'psych'

MADLIBS = Psych.load_file "madlibs.yaml"
SELECTIONS = {
  adjective: %w[quick lazy sleepy ugly],
  noun: %w[fox dog head],
  verb: %w[jumps lifts bites licks],
  adverb: %w[easily lazily noisily excitedly]
}

def madlibs
  sentences = MADLIBS.dup

  sentences.each do |sentence|
    loop do
      changed = false

      SELECTIONS.each do |type, choices|
        subbed = sentence.sub! "%{#{type}}", choices.sample
        changed = true if subbed
      end

      break unless changed
    end
  end

  puts sentences
end

# madlibs


# Seeing stars
# Star
MIN_STAR_WIDTH = 7

def star(width)
  return if width < MIN_STAR_WIDTH

  half = width / 2

  draw_star = proc do |y|
    line = y.zero? ? '*' * width : '*'.center(width)
    [-y, y].each { |space| line[half + space] = '*' }

    line
  end

  puts graph(draw_star, half)
end

# Circle
CIRCLE_Y_SCALE = 2
EDGE_FILLER = 1

def circle(diameter = 33)
  radius = diameter / 2
  max_distance = radius**2 + EDGE_FILLER

  draw_circle = proc do |y|
    y_sqr = y**2

    draw_circle_line = proc do |x|
      distance_to_center = x**2 + y_sqr
      distance_to_center <= max_distance ? '*' : ' '
    end

    split_line = graph(draw_circle_line, radius)
    split_line.join
  end

  puts "x**2 + y**2 = #{radius}**2 :".center(diameter)
  puts graph(draw_circle, radius, CIRCLE_Y_SCALE)
end

# Sine
require 'matrix'

SINE_SCALE = {x: 5.0, y: 2.5}

def sine_wave(amplitude: 1, period: 1)
  return if amplitude <= 0 || period <= 0

  puts "y = #{amplitude}sin(#{period}x) :"

  period /= SINE_SCALE[:x]

  draw_vertical_sine = proc do |x|
    line = scaled_sine_line(amplitude, period, x)
    line.split('')
  end

  puts rotated_graph(period, draw_vertical_sine)
end

def scaled_sine_line(amplitude, period, x)
  graph_size = (amplitude * 2) * SINE_SCALE[:y]

  y = amplitude * Math.sin(period * x)
  y_scaled = ((y + amplitude) * SINE_SCALE[:y]).round

  (' ' * graph_size).insert(y_scaled, '*')
end

def rotated_graph(period, draw_proc)
  period_length = ((2 * Math::PI) / period).ceil

  vertical_graph = graph(draw_proc, period_length / 2)
  rotated_graph = Matrix.columns(vertical_graph).to_a

  rotated_graph.map!(&:join)
end

def graph(draw_shape, height, step_by = 1)
  graph = []

  (-height).step(by: step_by, to: height) do |y|
    graph << draw_shape.call(y)
  end

  graph
end


# star(7)
# star(13)

# circle(5)
# circle

# sine_wave
# sine_wave(period: 2)
# sine_wave(amplitude: 2)
# sine_wave(amplitude: 3, period: 0.5)



# Transpose 3x3
def transpose(matrix)
  transposed = []

  matrix.each do |row|
    row.each_with_index do |element, index|
      transposed[index] = [] unless transposed[index]
      transposed[index] << element
    end
  end

  transposed
end

# Modify matrix in place
def transpose!(matrix)
  rows_transposed = []
  matrix.each_with_index do |row, row_index|
    row.each_with_index do |element, element_index|
      next if rows_transposed.include?(element_index)

      target_element = matrix[element_index][row_index]
      matrix[element_index][row_index], matrix[row_index][element_index] = element, target_element
    end

    rows_transposed << row_index
  end
  matrix
end

# matrix = [
#   [1, 5, 8], 1 4 3
#   [4, 7, 2], 5 7 9
#   [3, 9, 6]  8 2 6
# ]
# new_matrix = transpose!(matrix)
# p matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
# p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]


# Transpose MxN
# p transpose([[1, 2, 3, 4]])== [[1], [2], [3], [4]]
# p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
# p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
#   [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
# p transpose([[1]]) == [[1]]


# Rotating Matrices
def rotate(matrix, right_angle = 90)
  rotated = matrix.dup
  ((right_angle % 360) / 90).times do
    rotated = transpose(rotated.reverse)
  end
  rotated
end

matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

# new_matrix1 = rotate90(matrix1)
# new_matrix2 = rotate90(matrix2)
# new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

# p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
# p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
# p new_matrix3 == matrix2

# [0, 90, 180, 270, 360].each do |angle|
#   puts "rotated #{angle} degrees clockwise:"
#   rotate(matrix1, angle).each { |row| p row }
# end


# Fix the bug
def my_method(array)
  if array.empty?
    []
  elsif array.one?
    [7 * array.first]
  else
    array.map do |value|
      value * value
    end
  end
end

# p my_method([])
# p my_method([3])
# p my_method([3, 4])
# p my_method([5, 6, 7])

# elsif did not have a condition
# the block executed the array.map as a conditional
# which returns an array, which is true
# the actual elsif block is empty, so returns nil


# Merge sorted lists
def merge(arr1, arr2)
  index2 = 0
  sorted_arr = []

  arr1.each do |value1|
    while index2 < arr2.size && arr2[index2] <= value1
      sorted_arr << arr2[index2]
      index2 += 1
    end

    sorted_arr << value1
  end

  sorted_arr.concat(arr2[index2..])
end
# def merge(array1, array2)
#   index2 = 0
#   result = []

#   array1.each do |value|
#     while index2 < array2.size && array2[index2] <= value
#       result << array2[index2]
#       index2 += 1
#     end
#     result << value
#   end

#   result.concat(array2[index2..-1])
# end

# p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
# p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
# p merge([], [1, 4, 5]) == [1, 4, 5]
# p merge([1, 4, 5], []) == [1, 4, 5]
# p merge([1, 2, 3], [8, 9]) == [1, 2, 3, 8, 9]
# p merge([2, 6], [1, 4, 7]) == [1, 2, 4, 6, 7]


# Merge sort
# def merge_sort(arr)
#   return arr if arr.one? || arr.empty?

#   divided_arr = divide_array(arr)

#   sort_arr(divided_arr)
# end

def sort_arr(arr)
  return arr if arr.one? || arr.empty?

  merge(sort_arr(arr[0]), sort_arr(arr[1]))
end

def divide_array(arr)
  return arr if arr.one? || arr.empty?

  half = arr.size / 2
  [divide_array(arr[0..(half - 1)]), divide_array(arr[(half + 0)..])]
end

# SOLUTION
# def merge_sort(arr)
#   return arr if arr.size <= 1

#   sub1 = arr[0...arr.size / 2]
#   sub2 = arr[arr.size / 2...arr.size]

#   sub1 = merge_sort(sub1)
#   sub2 = merge_sort(sub2)

#   merge(sub1, sub2)
# end

# https://www.baeldung.com/cs/non-recursive-merge-sort
def merge_sort(arr)
  return arr if arr.empty? || arr.one?

  my_arr = arr.dup
  part_size = 1

  while part_size < arr.size
    index = 0

    while index < arr.size
      break if index + part_size >= arr.size

      first_end = index + part_size - 1
      second_start = index + part_size
      second_end = [index + (2 * part_size) - 1, arr.size - 1].min

      temp = merge(my_arr[index..first_end], my_arr[second_start..second_end])

      (second_end - index + 1).times do |i|
        my_arr[index + i] = temp[i]
      end

      index += part_size * 2
    end

    part_size *= 2
  end

  my_arr
end

# p merge_sort([]) == []
# p merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
# p merge_sort([5, 3]) == [3, 5]
# p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
# p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
# p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]


# Egyptian fractions

# algorithm
# with a rational number as input called "ration"
#
# initialize empty array called "denominators"
# looping from 1 to inf, storing number as "possible_denominator":
#   create unit Rational number using "possible_denominator" called "possible_rational"
#   with sum of all unit Rational numbers using each number stored in "denominators" array called "denominators_sum":
#   compare value of sum of "possible_rational" and "denominators_sum":
#     if greater than "ration"(input), continue to next iteration
#     if less than "ration"(input), store "possible_denominator" in "denominators" array
#     if equal to "ration"(input), store "possible_denominator" in "denominators" array AND exit loop
#
# array of denominators that sum to "ration"

# code
def egyptian(ration)
  denominators = []
  denominators_sum = 0

  possible_denominator = 0
  loop do
    possible_denominator += 1

    possible_rational = Rational(1, possible_denominator)
    total_sum = possible_rational + denominators_sum

    next if total_sum > ration 

    denominators << possible_denominator
    denominators_sum += possible_rational

    break if total_sum == ration
  end

  denominators
end
# mistakes made:
# in algo(+code): after comparison of total_sum and ration, stored posible_rational instead of possible_denominator
# in code: tried looping(.times) over range
# couldve clarified on getting and storing the sum of denominators array

def unegyptian(egyptian_array)
  sum = 0
  egyptian_array.each do |denominator|
    sum += Rational(1, denominator)
  end
  sum
end

# p egyptian(Rational(2, 1))# == [1, 2, 3, 6]
# p egyptian(Rational(137, 60))# == [1, 2, 3, 4, 5]
# p egyptian(Rational(3, 1))# == [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960]

# p unegyptian(egyptian(Rational(1, 2))) == Rational(1, 2)
# p unegyptian(egyptian(Rational(3, 4))) == Rational(3, 4)
# p unegyptian(egyptian(Rational(39, 20))) == Rational(39, 20)
# p unegyptian(egyptian(Rational(127, 130))) == Rational(127, 130)
# p unegyptian(egyptian(Rational(5, 7))) == Rational(5, 7)
# p unegyptian(egyptian(Rational(1, 1))) == Rational(1, 1)
# p unegyptian(egyptian(Rational(2, 1))) == Rational(2, 1)
# p unegyptian(egyptian(Rational(3, 1))) == Rational(3, 1)
