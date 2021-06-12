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

  it 'can return letters by shift' do
    shift = Shift.new('hello world!', '02715', '040895')
    expect(shift.shift_a_letters).to eq(['h', 'o', 'r'])
    expect(shift.shift_b_letters).to eq(['e', ' ', 'l'])
    expect(shift.shift_c_letters).to eq(['l', 'w', 'd'])
    expect(shift.shift_d_letters).to eq(['l', 'o', '!'])
  end

  it 'can find the cipher text by shift' do
    shift = Shift.new('hello world!', '02715', '040895')
    expect(shift.encrypt_shift_a).to eq(['k', 'r', 'u'])
    expect(shift.encrypt_shift_b).to eq(['e', ' ', 'l'])
    expect(shift.encrypt_shift_c).to eq(['d', 'o', 'w'])
    expect(shift.encrypt_shift_d).to eq(['e', 'h', '!'])
  end

  it 'can return crypted message' do
    shift = Shift.new('hello world', '02715', '040895')
    expect(shift.encrypted_message).to eq('keder ohulw')
  end
end
