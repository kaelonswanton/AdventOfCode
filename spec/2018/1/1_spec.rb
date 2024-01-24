RSpec.describe Advent do
  it 'determines the answer' do
    lines = [ '+13', '-2' ]

    expect(Advent.answer).to eq(42)
  end
end