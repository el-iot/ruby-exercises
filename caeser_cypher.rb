def _caeser(l, n)
  if 'abcdefghijklmnopqrstuvwxyz'.include?(l.downcase)
    is_upper = l == l.upcase
    translated = ((((l.downcase.ord - 97) + n) % 26) + 97).chr
    if is_upper
      return translated.upcase
    end
    return translated
  end
  return l
end

def caeser(s, n)
  return (
    s.split('').map do |letter| _caeser(letter, n) end
  ).join()
end

puts "What string would you like to use?"
s = gets.chomp

puts "By how many steps would you like to translate this string?"
n = gets.chomp.to_i % 26

puts caeser(s, n)
