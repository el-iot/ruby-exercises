# frozen_string_literal: true

def bubble_sort(array)
  unsorted = true
  unsorted, array = _sort(array) while unsorted
  array
end

def _sort(array)
  sorted = true
  (0..(array.length - 2)).each do |idx|
    if array[idx] > array[idx + 1]
      sorted = false
      array[idx], array[idx + 1] = [array[idx + 1], array[idx]]
    end
  end
  [!sorted, array]
end

puts bubble_sort([1, 2, 5, 4, 1, 7, 4, 7])

puts bubble_sort(%w[a b c banana caddy-shack])

def bubble_sort_by(array)
  unsorted = true
  while unsorted
    unsorted = false
    (0..(array.length - 2)).each do |idx|
      if yield(array[idx], array[idx + 1]).negative?
        unsorted = true
        array[idx], array[idx + 1] = [array[idx + 1], array[idx]]
      end
    end
  end
  array
end

arr = %w[hi hello yo i asdfasdf hey]
puts bubble_sort_by(arr) { |x, y| x.length - y.length }
