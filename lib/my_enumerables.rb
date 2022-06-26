module Enumerable
  def my_each_with_index
    for i in 0..(length - 1)
      yield(self[i], i)
    end
    self
  end

  def my_select
    arr = []
    my_each { |element| arr << element if yield(element) }
    arr
  end

  def my_all?
    arr = []
    my_each { |element| arr << element if yield(element) }
    return false unless arr.length == length

    true
  end

  def my_any?
    arr = []
    my_each { |element| arr << element if yield(element) }
    return false unless arr.length.positive?

    true
  end

  def my_none?
    arr = []
    my_each { |element| arr << element if yield(element) }
    return true unless arr.length.positive?

    false
  end

  def my_count
    total = 0
    if block_given?
      my_each { |element| total += 1 if yield(element) }
    else
      my_each { total += 1 }
    end
    total
  end

  def my_map
    arr = []
    my_each { |element| arr << yield(element) }
    arr
  end

  def my_inject(arg = 0)
    total = arg
    my_each { |element| total = yield(total, element) }
    total
  end
end

class Array
  def my_each
    for element in self
      yield element
    end
    self
  end
end
