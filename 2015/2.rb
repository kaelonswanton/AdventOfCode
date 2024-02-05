# frozen_string_literal: true

# remove x, l w h
# 2*l*w, 2*w*h, 2*h*l
# calculate l*w, then *2
# the smallest number before *2, add to answer
# 2x3x4 = 2*6 + 2*12 + 2*8 + 6 = 52

require "debug"
module PuzzleTwo
  file = "2x3x4"

  class PartOne
    attr_reader :file

    def initialize(file)
      @file = file
    end

    def call
      (2 * (length * width)) +
        (2 * (width * height)) +
        (2 * (height * length)) +
        smallest_side
    end

    private

    def delete_x
      file.delete("x")
    end

    def length
      delete_x[0].to_i
    end

    def width
      delete_x[1].to_i
    end

    def height
      delete_x[2].to_i
    end

    def smallest_side
      [
        [length * width],
        [width * height],
        [height * length]
      ].min.first
    end
  end
  PartOne.new(file).call
end
