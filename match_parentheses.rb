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

p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('What (is) this?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
p balanced?('') == true
p balanced?("[{;lk;'''''}]") == false
p balanced?("]()[]{}''\"\"\"\"[") == false
p balanced?("}{}") == false
p balanced?("\"\"\"'''") == false