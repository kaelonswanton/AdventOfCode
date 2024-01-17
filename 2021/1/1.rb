class To_Array
  def self.to_integer(file)
    File.read(file).split("\n").map(&:to_i)
  end
end

class Puzzle
  attr_reader :array

  def initialize(file)
    @array = To_Array.to_integer(file)
  end

  def arr_length
    0...array.length-1
  end

  def call
    counter = 0
    arr_length.each do |i|
      if array[i] < array[i+1]
        counter += 1
      end
    end
    counter
  end
end
p Puzzle.new('file').call
