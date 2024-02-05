# frozen_string_literal: true

require_relative "../../2015/2"

file = File.readlines("2015/file").map(&:chomp)

RSpec.describe PuzzleTwo do
  describe PuzzleTwo::PartOne do
    it "solves the puzzle" do
      expect(described_class.new(file).call).to eq(1588178)
    end
  end
end
