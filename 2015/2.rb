# frozen_string_literal: true

require "debug"
module PuzzleTwo
  file = File.readlines("2015/file").map(&:chomp)

  class PartOne
    attr_reader :file

    def initialize(file)
      @file = file
    end

    def call
      file.map do |line|
        calculate(line)
      end.sum
    end

    private

    def delete_x(line)
      line.split("x")
    end

    def dimensions(line)
      delete_x(line).map(&:to_i)
    end

    def smallest_side(length, width, height)
      [length * width, width * height, height * length].min
    end

    def calculate(line)
      length, width, height = dimensions(line)
      (2 * (length * width)) +
        (2 * (width * height)) +
        (2 * (height * length)) +
        smallest_side(length, width, height)
    end

  end
  puts PartOne.new(file).call
end
