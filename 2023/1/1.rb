# frozen_string_literal: true

class Puzzle
  attr_reader :lines

  def self.from_file(path)
    new(File.readlines(path).map(&:chomp))
  end

  def initialize(lines)
    @lines = lines
  end

  def call
    join_digits.sum
  end

  private

  def parse_digits
    lines.map do |line|
      line.scan(/\d/)
    end
  end

  def double_digits
    parse_digits.map do |subarray|
      subarray.length == 1 ? subarray * 2 : subarray
    end
  end

  def join_digits
    double_digits.map do |subarray|
      [subarray.first, subarray.last].join.to_i
    end
  end
end

p Puzzle.from_file("file").call
