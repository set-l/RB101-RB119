# Cute angles

def dms(angle)
  angle %= 360
  split_angle = angle.to_s.split('.')
  minutes = split_angle.length > 1 ? split_angle[-1].prepend('0.') : 0
  minutes = minutes.to_f * 60
  split_minutes = minutes.to_s.split('.')
  seconds = split_minutes.length > 1 ? split_minutes[-1].prepend('0.') : 0
  seconds = seconds.to_f * 60

  angle = angle.floor
  minutes = minutes.floor.to_s.rjust(2, '0')
  seconds = seconds.round.to_s.rjust(2, '0')
  "#{angle}°#{minutes}'#{seconds}\""
end

# p dms(30) == %(30°00'00")
# p dms(76.73) == %(76°43'48")
# p dms(254.6) == %(254°36'00")
# p dms(93.034773) == %(93°02'05")
# p dms(0) == %(0°00'00")
# p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
# p dms(400) == %(40°00'00")
# p dms(-40) == %(320°00'00")
# p dms(-420) == %(300°00'00")


# Delete vowels
def remove_vowels(strings)
  strings.map { |str| str.delete('aeiouAEIOU') }
end

# p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
# p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
# p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']


# Fibonacci number location by length
def find_fibonacci_index_by_length(num)
  fib = [1, 1]
  loop do
    fib << fib[-2] + fib[-1]
    length = fib[-1].to_s.length
    return fib.size if length == num
  end
end

# p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
# p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
# p find_fibonacci_index_by_length(10) == 45
# p find_fibonacci_index_by_length(100) == 476
# p find_fibonacci_index_by_length(1000) == 4782
# p find_fibonacci_index_by_length(10000) == 47847


# Reversed arrays (part 1)
def reverse!(arr)
  clone = arr.clone
  arr.each_index { |i| arr[i] = clone[-(i + 1)] }
end

# list = [1,2,3,4]
# result = reverse!(list)
# p result == [4, 3, 2, 1] # true
# p list == [4, 3, 2, 1] # true
# p list.object_id == result.object_id # true

# list = %w(a b e d c)
# p reverse!(list) == ["c", "d", "e", "b", "a"] # true
# p list == ["c", "d", "e", "b", "a"] # true

# list = ['abc']
# p reverse!(list) == ["abc"] # true
# p list == ["abc"] # true

# list = []
# p reverse!(list) == [] # true
# p list == [] # true


# Reversed arrays (part 2)
def reverse(arr)
  reversed = arr.empty? ? [] : [arr[0]]
  arr.inject { |memo, obj| reversed.prepend(obj) }
  # clone = arr.clone
  # clone.each_index { |i| clone[i] = arr[-(i + 1)] }
end

# p reverse([1,2,3,4]) == [4,3,2,1]          # => true
# p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
# p reverse(['abc']) == ['abc']              # => true
# p reverse([]) == []                        # => true

# list = [1, 3, 2]                      # => [1, 3, 2]
# new_list = reverse(list)              # => [2, 3, 1]
# p list.object_id != new_list.object_id  # => true
# p list == [1, 3, 2]                     # => true
# p new_list == [2, 3, 1]                 # => true


# Combining arrays
def merge(arr1, arr2)
  (arr1 + arr2).uniq
end

# p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]


# Halvsies
def halvsies(arr)
  half = (arr.size / 2.0).ceil
  halved = [[], []]
  arr.each_index do |i|
    halved_arr = i < ((arr.size / 2.0).ceil) ? 0 : 1
    halved[halved_arr] << arr[i]
  end
  halved
end

# p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
# p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
# p halvsies([5]) == [[5], []]
# p halvsies([]) == [[], []]


# Find the duplicate
def find_dup(arr)
  arr.each { |x| return x if arr.count(x) == 2 }
end

# p find_dup([1, 5, 3, 1]) == 1
# p find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
#           38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
#           14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
#           78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
#           89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
#           41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
#           55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
#           85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
#           40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
#           7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73


# Does my list include this?
def include?(arr, search)
  found = false
  arr.each { |x| found = true if x == search }
  found
end

# p include?([1,2,3,4,5], 3) == true
# p include?([1,2,3,4,5], 6) == false
# p include?([], 3) == false
# p include?([nil], nil) == true
# p include?([], nil) == false


# Mutation
# array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
# array2 = []
# array1.each { |value| array2 << value }
# array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
# puts array2

# %w(Moe Larry CURLY SHEMP Harpo CHICO Groucho Zeppo)
# array2 is referencing the same strings as array1

