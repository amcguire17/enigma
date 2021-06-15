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
    expected = {encryption: 'okfavfqdyry', key: '02715', date: '150621'}
    expect(encrypted).to eq(expected)
  end

  it 'can decrypt a message with just a key' do
    decrypted = @enigma.decrypt('okfavfqdyry', '02715')
    expected = {decryption: 'hello world', key: '02715', date: '150621'}
    expect(decrypted).to eq(expected)
  end

  it 'can encrypt a message with a random key and todays date' do
    expected = {encryption: 'eypclt foeh', key: '46817', date: '150621'}
    allow(@enigma).to receive(:encrypt).and_return(encryption: 'eypclt foeh', key: '46817', date: '150621')
    expect(@enigma.encrypt('hello world')).to eq(expected)
  end

  it 'can generate a random key' do
    expect(@enigma.random_key.length).to eq(5)
  end

  it 'can encrypt message' do
    expect(@enigma.encrypt_message('hello world', '02715', '040895')).to eq('keder ohulw')
  end

  it 'can decrpyt message' do
    expect(@enigma.decrypt_message('keder ohulw', '02715', '040895')).to eq('hello world')
  end
end
