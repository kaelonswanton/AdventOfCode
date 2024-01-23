# frozen_string_literal: true

class Puzzle
  attr_reader :range

  def initialize(string)
    range_start, range_end = string.split("-").map(&:to_i)
    @range = (range_start..range_end)
  end

  def valid_password_count
    range.count do |num|
      digits = num.to_s.chars
      adjacent_equal?(digits) && never_decreases?(digits)
    end
  end

  private

  def adjacent_equal?(digits)
    digits.each_cons(2).any? { |a, b| a == b }
  end

  def never_decreases?(digits)
    digits.each_cons(2).all? { |a, b| a <= b } 
  end
end

puts Puzzle.new(File.read("file")).valid_password_count
