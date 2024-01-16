require 'set'
class NumberRange
  attr_reader :file

  def initialize(file)
    @file = file
  end

  def range
    count = 0

    lines.each do |line|
      numbers = line.scan(/\d+/).map(&:to_i)
      first = (numbers[0]..numbers[1]).to_a
      second = (numbers[2]..numbers[3]).to_a
      count += check_overlap(first, second)
    end
    p count
  end
      
  def check_overlap(first, second)
    first_set = first.to_set
    second_set = second.to_set
    first_set.subset?(second_set) || second_set.subset?(first_set) ? 1 : 0
  end

  def lines
    file.split("\n")
  end
end

NumberRange.new(File.read('file')).range


