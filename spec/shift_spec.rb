require 'date'
require './lib/shift'

RSpec.describe Shift do
  it 'can create alphabet' do
    shift = Shift.new('hello world', '02715', '040895')
    expected = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', ' ']
    expect(shift.alphabet).to eq(expected)
  end

  it 'can create offset from date' do
    shift = Shift.new('hello world', '02715', '040895')

    expect(shift.shift_offset).to eq([1, 0, 2, 5])
  end

  it 'can create 4 shift keys' do
    shift = Shift.new('hello world', '02715', '040895')

    expect(shift.shift_key).to eq([0, 2, 7, 1, 5])
  end

  it 'can return shift a' do
    shift = Shift.new('hello world', '02715', '040895')
    expect(shift.shift_a_letters).to eq(['h', 'o', 'r'])

  end

  it 'can return shift b' do
    shift = Shift.new('hello world', '02715', '040895')
    expect(shift.shift_b_letters).to eq(['e', ' ', 'l'])
  end

  it 'can return shift c' do
    shift = Shift.new('hello world', '02715', '040895')
    expect(shift.shift_c_letters).to eq(['l', 'w', 'd'])
  end

  it 'can return shift d' do
    shift = Shift.new('hello world', '02715', '040895')
    expect(shift.shift_d_letters).to eq(['l', 'o'])
  end
end
