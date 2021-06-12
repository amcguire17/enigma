require 'date'
require './lib/enigma'

RSpec.describe Shift do
  it 'can create alphabet' do
    enigma = Enigma.new
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
    expect(enigma.alphabet).to eq(expected)
  end

  it 'can create offset from date' do
    enigma = Enigma.new
    expect(enigma.shift_offset("040895")).to eq([1, 0, 2, 5])
  end

  it 'can create 4 shift keys' do
    enigma = Enigma.new
    expect(enigma.shift_key("02715")).to eq([0, 2, 7, 1, 5])
  end

  it 'can return shift a' do
    enigma = Enigma.new
  end

  it 'can return shift b' do
    enigma = Enigma.new
  end

  it 'can return shift c' do
    enigma = Enigma.new
  end

  it 'can return shift d' do
    enigma = Enigma.new
  end
end
