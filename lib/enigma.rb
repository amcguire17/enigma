require './lib/shift'

class Enigma
  def encrypt(message, key = 0, date = 0)
    shift = Shift.new(message.downcase, key, date)
    {encryption: shift.encrypted_message, key: shift.shift_keys.key, date: shift.shift_keys.offset}
  end

  def decrypt(message, key = 0, date = 0)
    shift = Shift.new(message.downcase, key, date)
    {decryption: shift.decrypted_message, key: shift.shift_keys.key, date: shift.shift_keys.offset}
  end

  def crack(message, date = 0)
    shift = Shift.new(message.downcase, 0, date)
    {decryption: shift.cracked_message, key: shift.shift_keys.crack_key, date: shift.shift_keys.offset}
  end
end
