require './lib/key'
require './lib/message'
require './lib/modules/cryptograble'

class Shift
  include Cryptograble

  def initialize(message, key, date)
    @shift_message = Message.new(message)
    @shift_keys = Key.new(key, date)
  end

  def alphabet
    ('a'..'z').to_a << ' '
  end

  def encrypt_shift_a
    encrypt_letters(@shift_message.shift_a_letters, @shift_keys.shift_a_amount)
  end

  def encrypt_shift_b
    encrypt_letters(@shift_message.shift_b_letters, @shift_keys.shift_b_amount)
  end

  def encrypt_shift_c
    encrypt_letters(@shift_message.shift_c_letters, @shift_keys.shift_c_amount)
  end

  def encrypt_shift_d
    encrypt_letters(@shift_message.shift_d_letters, @shift_keys.shift_d_amount)
  end

  def encrypted_message
    join_shifted_letters(encrypt_shift_a, encrypt_shift_b, encrypt_shift_c, encrypt_shift_d)
  end

  def decrypt_shift_a
    decrypt_letters(@shift_message.shift_a_letters, @shift_keys.shift_a_amount)
  end

  def decrypt_shift_b
    decrypt_letters(@shift_message.shift_b_letters, @shift_keys.shift_b_amount)
  end

  def decrypt_shift_c
    decrypt_letters(@shift_message.shift_c_letters, @shift_keys.shift_c_amount)
  end

  def decrypt_shift_d
    decrypt_letters(@shift_message.shift_d_letters, @shift_keys.shift_d_amount)
  end

  def decrypted_message
    join_shifted_letters(decrypt_shift_a, decrypt_shift_b, decrypt_shift_c, decrypt_shift_d)
  end
end
