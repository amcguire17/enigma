require './lib/key'

RSpec.describe Key do
  before(:each) do
    @key = Key.new('02715', '040895')
  end
  it 'exists' do
    expect(@key).to be_a(Key)
  end

  it 'can return string as array' do
    expect(@key.split_key).to eq([0, 2, 7, 1, 5])
  end

  it 'can square the date for the offset' do
    expect(@key.square_offset).to eq(1672401025)
  end

  it 'can return offset as a collection of integers' do
    expect(@key.split_offset).to eq([1, 0, 2, 5])
  end

  it 'can return amount of each shift' do
    expect(@key.shift_a_amount).to eq(3)
    expect(@key.shift_b_amount).to eq(27)
    expect(@key.shift_c_amount).to eq(73)
    expect(@key.shift_d_amount).to eq(20)
  end
end
