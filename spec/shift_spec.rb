require 'date'
require './lib/shift'

RSpec.describe Shift do
  describe 'Encrypting Message' do
    before(:each) do
      @shift = Shift.new('hello world!!!!', '02715', '040895')
    end

    it 'exists' do
      expect(@shift).to be_a(Shift)
    end

    it 'can create alphabet' do
      expected = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', ' ']
      expect(@shift.alphabet).to eq(expected)
    end

    it 'can find the cipher text by shift' do
      expect(@shift.encrypt_shift_a).to eq(['k', 'r', 'u', '!'])
      expect(@shift.encrypt_shift_b).to eq(['e', ' ', 'l', '!'])
      expect(@shift.encrypt_shift_c).to eq(['d', 'o', 'w', '!'])
      expect(@shift.encrypt_shift_d).to eq(['e', 'h', '!'])
    end

    it 'can return encrypted message' do
      expect(@shift.encrypted_message).to eq('keder ohulw!!!!')
    end
  end

  describe 'Decrypting Message' do
    before(:each) do
      @shift = Shift.new('keder ohulw!!!!', '02715', '040895')
    end

    it 'can find the decipher text by shift' do
      expect(@shift.decrypt_shift_a).to eq(['h', 'o', 'r', '!'])
      expect(@shift.decrypt_shift_b).to eq(['e', ' ', 'l', '!'])
      expect(@shift.decrypt_shift_c).to eq(['l', 'w', 'd', '!'])
      expect(@shift.decrypt_shift_d).to eq(['l', 'o', '!'])
    end

    it 'can return decrypted message' do
      expect(@shift.decrypted_message).to eq('hello world!!!!')
    end
  end
end
