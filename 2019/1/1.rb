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
      result = divide_by_three(line)
      subtract_two(result)
    end
  end

  private

  def divide_by_three(line)
    line / 3
  end

  def subtract_two(result)
    result - 2
  end
end

p Puzzle.from_file("file").call
