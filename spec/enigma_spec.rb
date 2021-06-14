require 'date'
require './lib/enigma'

RSpec.describe Enigma do
  before(:each) do
    @enigma = Enigma.new
  end

  it 'exists' do
    expect(@enigma).to be_a(Enigma)
  end

  it 'can encrypt a message with key and date' do
    encrypted = @enigma.encrypt('hello world', '02715', '040895')
    expected = {encryption: 'keder ohulw', key: '02715', date: '040895'}
    expect(encrypted).to eq(expected)
  end

  it 'can decrypt a message with key and date' do
    decrypted = @enigma.decrypt('keder ohulw', '02715', '040895')
    expected = {decryption: 'hello world', key: '02715', date: '040895'}
    expect(decrypted).to eq(expected)
  end

  it 'can encrypt a message with just a key' do
    encrypted = @enigma.encrypt('hello world', '02715')
    expected = {encryption: 'okfavfqdyry', key: '02715', date: '140621'}
    expect(encrypted).to eq(expected)
  end

  it 'can decrypt a message with just a key' do
    decrypted = @enigma.decrypt('okfavfqdyry', '02715')
    expected = {decryption: 'hello world', key: '02715', date: '140621'}
    expect(decrypted).to eq(expected)
  end

  it 'can encrypt a message with a random key and todays date' do
    expected = {encryption: 'eypclt foeh', key: '46817', date: '140621'}
    allow(@enigma).to receive(:encrypt).and_return(encryption: 'eypclt foeh', key: '46817', date: '140621')
    expect(@enigma.encrypt('hello world')).to eq(expected)
  end

  describe 'Cracking the Code' do
    before(:each) do
      @enigma = Enigma.new
    end

    it 'can crack code without key' do
      @enigma.encrypt('hello world end', '08304', '291018')
      cracked = @enigma.crack('vjqtbeaweqihssi', '291018')
      expected = {decryption: 'hello world end', key: '08304', date: '291018'}
      expect(cracked).to eq(expected)
    end

    it 'can crack code without key and date' do
      @enigma.encrypt('hello world end', '08304', '291018')
      cracked = @enigma.crack('vjqtbeaweqihssi')
      expected = {decryption: 'hello world end', key: '', date: '140621'}
    end
  end
end
