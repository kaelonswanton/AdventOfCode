# frozen_string_literal: true

module PuzzleOne
  file = "(((())))))))"

  class PartOne
    attr_reader :file

    def initialize(file)
      @file = file
    end

    def call
      scan_left - scan_right
    end

    private

    def scan_left
      file.scan("(").length
    end

    def scan_right
      file.scan(")").length
    end
  end
  puts PartOne.new(file).call

  class PartTwo
    attr_reader :file

    def initialize(file)
      @file = file
    end

    def call
      process_chars
    end

    private

    def process_chars
      counter = 0
      file.chars.each_with_index do |char, index|
        counter = count_chars(char, counter)
        return (index + 1).to_s if counter == -1
      end
    end

    def count_chars(char, counter)
      char == "(" ? counter + 1 : counter - 1
    end
  end
  puts PartTwo.new(file).call
end
