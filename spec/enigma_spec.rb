require 'date'
require './lib/enigma'

RSpec.describe Enigma do
  it 'exists' do
    enigma = Enigma.new
    expect(enigma).to be_a(Enigma)
  end

  it 'can encrypt a message with key and date' do
    enigma = Enigma.new
    encrypted = enigma.encrypt("hello world", "02715", "040895")
    expected = {encryption: "keder ohulw", key: "02715", date: "040895"}
    expect(encrypted).to eq(expected)
  end

  it 'can decrypt a message with key and date' do
    enigma = Enigma.new
    decrypted = enigma.decrypt("keder ohulw", "02715", "040895")
    expected = {decryption: "hello world", key: "02715", date: "040895"}
    expect(decrypted).to eq(expected)
  end

  it 'can encrypt a message with just a key' do
    enigma = Enigma.new
    encrypted = enigma.encrypt("hello world", "02715")
    expected = {encryption: "keder ohulw", key: "02715", date: "110621"}
    expect(encrypted).to eq(expected)
  end

  it 'can decrypt a message with just a key' do
    enigma = Enigma.new
    decrypted = enigma.decrypt(encrypted[:encryption], "02715")
    expected = {decryption: "hello world", key: "02715", date: "110621"}
    expect(decrypted).to eq(expected)
  end

  it 'can encrypt a message with a random key and todays date' do
    enigma = Enigma.new
    encrypted = enigma.encrypt("hello world")
    expected = {encryption: "keder ohulw", key: "46817", date: "110621"}
    expect(encrypted).to eq(expected)
  end
end
