class ToArray
  def self.to_integer(file)
    File.read(file).split("\n").map(&:to_i)
  end
end

class ConsArray
  def self.to_cons(array)
    array.each_cons(3).to_a.map do |array|
      array.sum
    end
  end
end

class Puzzle
  attr_reader :array

  def initialize(path)
    @array = ConsArray.to_cons(ToArray.to_integer(path))
  end

  def array_iterates
    0...array.length-1
  end

  def call
    counter = 0
    array_iterates.each do |i|
      if array[i] < array[i+1]
        counter += 1
      end
    end
    p counter
  end
end

Puzzle.new('file').call