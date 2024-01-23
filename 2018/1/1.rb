# frozen_string_literal: true

class Puzzle
  attr_reader :strings

  def initialize(string)
    @strings = string
  end

  def call
    strings
      .map { |line| process_line(line) }
      .flatten
      .sum
  end

  private

  def process_line(line)
    line.split.map(&:to_i)
  end
end

p Puzzle.new(File.readlines("file")).call
