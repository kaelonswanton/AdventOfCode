require "rspec"
require_relative "../../../2019/1/1"

RSpec.describe Puzzle do
  it "returns the correct result" do
    line = 12
    result = Puzzle.new.call(line)
    expect(result).to eq(2)
  end

  it "returns an array of numbers" do
    line = "12"
    result = 12
    expect(result).to be_a(Integer)
  end
end