module Enumerable
  # Your code goes here
  def my_each_with_index
    for i in 0..(self.length - 1)
      yield(self[i], i)
    end
    self
  end

  def my_select
    arr = []
    self.my_each { |element| arr << element if yield(element) }
    arr
  end

  def my_all?
    arr = []
    self.my_each { |element| arr << element if yield(element) }
    return false unless arr.length == self.length

    true
  end

  def my_any?
    arr = []
    self.my_each { |element| arr << element if yield(element) }
    return false unless arr.length > 0

    true
  end

  def my_none?
    arr =[]
    self.my_each { |element| arr << element if yield(element) }
    return true unless arr.length.positive?

    false
  end

  def my_count
    total = 0
    if block_given?
      self.my_each { |element| total += 1 if yield(element) }
    else
      self.my_each { total += 1 }
    end
    total
  end

  def my_map
    arr = []
    self.my_each { |element| arr << yield(element) }
    arr
  end

  def my_inject(arg = 0)
    total = arg
    self.my_each { |element| total = yield(total, element) }
    total
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for i in 0..(self.length - 1)
      yield(self[i])
    end
    self
  end
end
