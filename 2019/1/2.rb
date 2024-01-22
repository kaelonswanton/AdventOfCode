# frozen_string_literal: true

module ToArray
  def self.openfile(file)
    File.readlines(file).map(&:to_i)
  end
end

class Puzzle
  attr_reader :lines

  def self.from_file(path)
    new(ToArray.openfile(path))
  end

  def initialize(lines)
    @lines = lines
  end

  def call
    lines.sum do |line|
      before_zero(line)
    end
  end

  private

  def divide_subtract(line)
    (line / 3) - 2
  end

  def before_zero(value)
    sum = 0
    while value.positive?
      value = divide_subtract(value)
      sum += value if value.positive?
    end
    sum
  end
end

p Puzzle.from_file("file").call
