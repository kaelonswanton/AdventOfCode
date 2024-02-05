# frozen_string_literal: true

require_relative "../../2015/2"

file = "2x3x4"
RSpec.describe PuzzleTwo do
  describe PuzzleTwo::PartOne do
    it "solves the puzzle" do
      expect(described_class.new(file).call).to eq(58)
    end
  end
end
