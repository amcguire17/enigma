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

    expect(enigma.shift_offset('040895')).to eq([1, 0, 2, 5])
  end

  it 'can create 4 shift keys' do
    shift = Shift.new('hello world', '02715', '040895')

    expect(enigma.shift_key('02715')).to eq([0, 2, 7, 1, 5])
  end

  it 'can return shift a' do
    shift = Shift.new('hello world', '02715', '040895')
    expect(shift.shift_a).to eq(['k', 'r', 'u'])

  end

  it 'can return shift b' do
    shift = Shift.new('hello world', '02715', '040895')
    expect(shift.shift_b).to eq(['e', ' ', 'l'])
  end

  it 'can return shift c' do
    shift = Shift.new('hello world', '02715', '040895')
    expect(shift.shift_c).to eq(['d', 'o', 'w'])
  end

  it 'can return shift d' do
    shift = Shift.new('hello world', '02715', '040895')
    expect(shift.shift_d).to eq(['e', 'h'])
  end
end
