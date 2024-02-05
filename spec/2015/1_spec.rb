# frozen_string_literal: true

require_relative "../../2015/1"

file = ")())())"
RSpec.describe PuzzleOne do
  describe PuzzleOne::PartOne do
    it "adds '('' and subtracts ')'" do
      expect(described_class.new(file).call).to eq(-3)
    end
  end

  describe PuzzleOne::PartTwo do
    it "finds index position+1 of -1" do
      expect(described_class.new(file).call).to eq("1")
    end
  end
end
