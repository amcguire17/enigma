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
      expect(@key.crack_shift_a_sub_offset).to eq(8)
      expect(@key.crack_shift_b_sub_offset).to eq(2)
      expect(@key.crack_shift_c_sub_offset).to eq(3)
      expect(@key.crack_shift_d_sub_offset).to eq(4)
    end

    it 'can return list of correct shift key options' do
      expect(@key.crack_shift_a_key_options).to eq([['0', '8'], ['3', '5'], ['6', '2'], ['8', '9']])
      expect(@key.crack_shift_b_key_options).to eq([['0', '2'], ['2', '9'], ['5', '6'], ['8', '3']])
      expect(@key.crack_shift_c_key_options).to eq([['0', '3'], ['3', '0'], ['5', '7'], ['8', '4']])
      expect(@key.crack_shift_d_key_options).to eq([['0', '4'], ['3', '1'], ['5', '8'], ['8', '5']])
    end

    it 'can compare shift key option lists' do
      expect(@key.compare_shifts).to eq({c: ['3', '0']})
    end

    it 'can return cracked key' do
      @key.crack_key
      expect(@key.key).to eq('08304')
    end
  end
end
