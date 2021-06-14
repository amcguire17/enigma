require './lib/key'

RSpec.describe Key do
  before(:each) do
    @shift = Shift.new('hello world', '02715', '040895')
    @key = Key.new('02715', '040895', @shift)
  end
  it 'exists' do
    expect(@key).to be_a(Key)
  end

  it 'can generate a random key' do
    key = Key.new(0, 0, @shift)
    expect(key.random_key.length).to eq(5)
  end

  it 'can return todays date' do
    key = Key.new(0, 0, @shift)
    expect(@key.date_today).to eq('150621')
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

  describe 'Cracking the key' do
    before(:each) do
      @shift = Shift.new('vjqtbeaweqihssi', 0, '291018')
      @key = Key.new(0, '291018', @shift)
    end

    it 'can rotate shift to correct position' do
      expect(@key.crack_rotate_for_shift).to eq([14, 5, 5, 8])
    end

    it 'can find key in correct shift position' do
      expect(@key.crack_shift_a_key).to eq(['0', '8'])
      expect(@key.crack_shift_b_key).to eq(['0', '2'])
      expect(@key.crack_shift_c_key).to eq(['0', '3'])
      expect(@key.crack_shift_d_key).to eq(['0', '4'])
    end

    it 'can find key by shift to combine final cracked key' do
      expect(@key.crack_a_key).to eq('08')
      expect(@key.crack_b_key).to eq('3')
      expect(@key.crack_c_key).to eq('0')
      expect(@key.crack_d_key).to eq('4')
    end

    it 'can return cracked key' do
      @key.crack_key
      expect(@key.key).to eq('08304')
    end
  end
end
