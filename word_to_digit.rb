NUMBER_WORDS = %w[zero one two three four five six seven eight nine]

def word_to_digit(sentence)
  10.times { |i| sentence.gsub!(NUMBER_WORDS[i], i.to_s) }
  sentence
end

p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
