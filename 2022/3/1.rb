#Split a string in half, find common letter from both
#Turn letter into number, sum
#lower_case = (char.ord)-96 # 1
#upper_case =  (char.ord)-38 # 27

# half = string.length / 2
# p first_half = string.slice(0, half)
# p second_half = string.slice(half, string.length)
# common_chars = first_half.chars & second_half.chars
# p common_chars

class Line
  attr_reader :string

  def initialize(string)
    @string = string
  end

  def length
    @string.length
  end

  def half_length
    length / 2
  end

  def halves
    head = string.slice(0, half_length)
    tail = string.slice(half_length, length)

    [head, tail]
  end

  def common_chars
    head, tail = halves #gives us the local variables from #halves
    head.chars & tail.chars
  end

  def sum_of_common_chars
    common_chars.map do |char|
      if char.ord >= 97
        (char.ord - 96)
      else
        (char.ord - 38)
      end
    end
  end
end

class Puzzle
  attr_reader :file

  def initialize(file)
   @file = file  
  end

  def call
    strings.map do |string|
      line = Line.new(string)
      line.sum_of_common_chars
      .sum
    end
  end

  def strings
    file.split("\n")
  end
end

p Puzzle.new(File.read('file')).call.sum