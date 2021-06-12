require 'date'
require './lib/enigma'

RSpec.describe Enigma do
  it 'exists' do
    enigma = Enigma.new
    expect(enigma).to be_a(Enigma)
  end

  it 'can encrypt a message with key and date' do
    enigma = Enigma.new
    encrypted = enigma.encrypt('hello world', '02715', '040895')
    expected = {encryption: 'keder ohulw', key: '02715', date: '040895'}
    expect(encrypted).to eq(expected)
  end

  it 'can decrypt a message with key and date' do
    enigma = Enigma.new
    decrypted = enigma.decrypt('keder ohulw', '02715', '040895')
    expected = {decryption: 'hello world', key: '02715', date: '040895'}
    expect(decrypted).to eq(expected)
  end

  it 'can encrypt a message with just a key' do
    enigma = Enigma.new
    encrypted = enigma.encrypt('hello world', '02715')
    expected = {encryption: 'okfavfqdyry', key: '02715', date: '120621'}
    expect(encrypted).to eq(expected)
  end

  it 'can decrypt a message with just a key' do
    enigma = Enigma.new
    encrypted = enigma.encrypt('hello world', '02715')
    decrypted = enigma.decrypt(encrypted[:encryption], '02715')
    expected = {decryption: 'hello world', key: '02715', date: '120621'}
    expect(decrypted).to eq(expected)
  end

  it 'can encrypt a message with a random key and todays date' do
    enigma = Enigma.new
    expected = {encryption: 'eypclt foeh', key: '46817', date: '120621'}
    allow(enigma).to receive(:encrypt).and_return(encryption: 'eypclt foeh', key: '46817', date: '120621')
    expect(enigma.encrypt('hello world')).to eq(expected)
  end

  it 'can generate a random key' do
    enigma = Enigma.new
    expect(enigma.random_key.length).to eq(5)
  end

  it 'can encrypt message' do
    enigma = Enigma.new
    expect(enigma.encrypt_message('hello world', '02715', '040895')).to eq('keder ohulw')
  end

  it 'can decrpyt message' do
    enigma = Enigma.new
    expect(enigma.decrypt_message('keder ohulw', '02715', '040895')).to eq('hello world')
  end
end
