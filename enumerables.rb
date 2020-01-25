# frozen_string_literal: true

# comment
module Enumerable
  def my_each
    for idx in 0...self.length
      yield self[idx]
    end
    self
  end

  def my_each_with_index
    for idx in 0...self.length
      yield(self[idx], idx)
    end
    self
  end

  def my_select
    output = []
    my_each do |e|
      output.push(e) if yield e
    end
    output
  end

  def my_all?
    output = true
    my_each do |e|
      output = false unless yield e
    end
    output
  end

  def my_any?
    output = false
    my_each do |e|
      output = true if yield e
    end
    output
  end

  def my_none?
    output = true
    my_each do |e|
      output = false if yield e
    end
    output
  end

  def my_count
    return self.length unless block_given?

    count = 0
    my_each do |e|
      count += 1 if yield e
    end
    count
  end

  def my_map(procedure=nil)
    output = []
    if procedure.nil?
      my_each do |e|
        output.push(yield(e))
      end
    else
      my_each do |e|
        output.push(procedure.call(e))
      end
    end
    output
  end

  def my_inject(acc=nil)
    if acc.nil?
      acc = self[0]
      idx = 1
    else
      idx = 0
    end

    for i in idx...self.length
      acc = yield(acc, self[i])
    end
    acc
  end
end

def multiply_els(arr)
  arr.my_inject{|acc, val| acc * val}
end

x = [1, 2, 3, 4, 5]

x.my_each do |e|
  puts e * 2
end

x.my_each_with_index do |e, idx|
  puts e * 2 if idx.odd?
end

y = x.my_select do |e|
  e.odd?
end
print y

puts

puts(x.my_all? { | e | e < 6})

puts(x.my_all? { | e | e > 2})

puts(x.my_any? { | e | e == 4})

puts(x.my_none? { | e | e == 'hello'})

puts(x.my_count { | e | e.even? })

puts(x.my_count)

print(x.my_map{|e| e**3})

procedure = Proc.new{|e| e**3}

print(x.my_map(procedure))

puts

puts(x.my_inject(10){|acc, val| acc * val})
puts(x.my_inject{|acc, val| acc * val})

puts multiply_els(x)
