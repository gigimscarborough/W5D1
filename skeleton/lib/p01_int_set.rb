class MaxIntSet

  attr_reader :store
  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
    if num > 0 && num < @store.length
      @store[num] = true 
    else 
      raise "Out of bounds"
    end
  end

  def remove(num)
    if num > 0 && num < @store.length
      @store[num] = false 
    else 
      raise "Out of bounds"
    end
  end

  def include?(num)
    return true if @store[num] == true
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    @store[num % @store.length] << num
  end

  def remove(num)
    @store[num % @store.length].delete(num)
  end

  def include?(num)
    @store[num % @store.length].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end
require "byebug"
class ResizingIntSet
  attr_accessor :store, :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if !self.include?(num)
      self[num] << num
      @count += 1
      resize! if num_buckets < count
    end
  end

  def remove(num)
    if self.include?(num)
      self[num].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    @store[num % @store.length].include?(num)
  end

  # private

  def [](num)
    @store[num % @store.length]
  end

  def num_buckets
    @store.length
  end

  def resize!
    oldbuckets  = self.store
    self.count = 0
    self.store = Array.new(num_buckets * 2) { Array.new }
    oldbuckets.each do |arr|
      arr.each do |num|
        self.insert(num)
      end
    end
  end
end
