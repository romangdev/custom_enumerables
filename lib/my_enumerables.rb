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
    for i in 0..(self.length - 1)
      result = yield self[i]
      if result == true
        arr << self[i]
      end
    end
    return arr
  end

  def my_all?
    arr = []
    for i in 0..(self.length - 1)
      result = yield self[i]
      if result == true
        arr << self[i]
      end
    end
    return false unless arr.length == self.length
    return true
  end

  def my_any?
    arr =[]
    for i in 0..(self.length - 1)
      if yield(self[i]) == true
        arr << self[i]
      end
    end
    return false unless arr.length > 0
    return true
  end

  def my_none?
    arr =[]
    for i in 0..(self.length - 1)
      if yield(self[i]) == true
        arr << self[i]
      end
    end
    return true unless arr.length > 0
    return false
  end

  def my_count
    total = 0
    if block_given?
      for i in 0..(self.length - 1)
        total += 1 if yield(self[i]) == true
      end
    else
      # block = Proc.new {|element| total += 1}
      self.my_each {|element| total += 1}
    end
    return total
  end

  def my_map
    arr = []
    self.each {|element| arr << yield(element)}
    return arr
  end

  def my_inject(arg = 0)
    total = arg
    self.my_each {|element| total = yield(total, element)}
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
