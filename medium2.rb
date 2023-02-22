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

p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }
p letter_percentages("abcdefGHI") == {:lowercase=>66.7, :uppercase=>33.3, :neither=>0.0}
