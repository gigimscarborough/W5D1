class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    hello = 0
    self.each_with_index.inject(0) do |acc, (ele, i)|
      hello = (ele.hash + i.hash) ^ acc
    end
    p hello
  end
end


class String
  def hash
    alpha = ("a".."z").to_a
    upper_alpha = ("A".."Z").to_a
    final = alpha + upper_alpha
    self.split("").map(&:final.index).hash

  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    0
  end
end
