# frozen_string_literal: true

require_relative "../../2015/1"

file = ")())())"
RSpec.describe PartOne do
  it "adds '('' and subtracts ')'" do
    expect(PartOne.new(file).call).to eq(-3)
  end
end

RSpec.describe PartTwo do
  it "finds index position+1 of -1" do
    expect(PartTwo.new(file).call).to eq("1")
  end
end
