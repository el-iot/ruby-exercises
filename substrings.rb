# frozen_string_literal: true

def substrings(string, array)
  string = string.downcase
  output = {}

  array.each do |item|
    item = item.downcase
    count = string.scan(item).length
    output[item] = count if count.positive?
  end

  output
end

dictionary = %w[below down go going horn how howdy it i low own part partner sit]
puts substrings('below', dictionary)
puts substrings("Howdy partner, sit down! How's it going?", dictionary)
