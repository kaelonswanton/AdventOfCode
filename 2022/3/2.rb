class Lines
  attr_reader :lines

  def initialize(lines)
    @lines = lines
  end

  def group_lines
    lines.split("\n").each_slice(3).to_a
  end

  def common_chars
    group_lines.map do |group|
      group.map(&:chars).inject(:&)
    end
  end
end

class Puzzle
  def initialize(file)
    @file = file
  end

  def call
    Lines.new(@file)
      .common_chars
      .flatten
      .map { |char| to_integer(char) }
      .sum
  end

  def to_integer(char)
    if char.ord >= 97
      (char.ord - 96)
    else
      (char.ord - 38)
    end
  end
end

p Puzzle.new(File.read('file')).call