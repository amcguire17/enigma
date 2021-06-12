require './lib/key'

class Shift
  def initialize(message, key, date)
    @message = message
    @shift_keys = Key.new(key, date)
  end

  def alphabet
    ('a'..'z').to_a << ' '
  end

  def shift_a_letters
    a = []
    mess_array = @message.split('').to_enum
    mess_array.with_index do |letter, index|
      if index % 4 == 0
        a << letter
      end
    end
    a
  end

  def shift_b_letters
    b = []
    mess_array = @message.split('').to_enum
    mess_array.with_index do |letter, index|
      if index % 4 == 1
        b << letter
      end
    end
    b
  end

  def shift_c_letters
    c = []
    mess_array = @message.split('').to_enum
    mess_array.with_index do |letter, index|
      if index % 4 == 2
        c << letter
      end
    end
    c
  end

  def shift_d_letters
    d = []
    mess_array = @message.split('').to_enum
    mess_array.with_index do |letter, index|
      if index % 4 == 3
        d << letter
      end
    end
    d
  end

  def encrypt_shift_a
    shift_a_letters.map do |letter|
      if alphabet.include?(letter)
        index = alphabet.find_index(letter)
        alphabet.rotate(@shift_keys.shift_a_amount)[index]
      else
        letter
      end
    end
  end

  def encrypt_shift_b
    shift_b_letters.map do |letter|
      if alphabet.include?(letter)
        index = alphabet.find_index(letter)
        alphabet.rotate(@shift_keys.shift_b_amount)[index]
      else
        letter
      end
    end
  end

  def encrypt_shift_c
    shift_c_letters.map do |letter|
      if alphabet.include?(letter)
        index = alphabet.find_index(letter)
        alphabet.rotate(@shift_keys.shift_c_amount)[index]
      else
        letter
      end
    end
  end

  def encrypt_shift_d
    shift_d_letters.map do |letter|
      if alphabet.include?(letter)
        index = alphabet.find_index(letter)
        alphabet.rotate(@shift_keys.shift_d_amount)[index]
      else
        letter
      end
    end
  end

  def encrypted_message
    new = encrypt_shift_a.zip(encrypt_shift_b, encrypt_shift_c, encrypt_shift_d)
    new.flatten.join
  end

  def decrypt_shift_a
    shift_a_letters.map do |letter|
      if alphabet.include?(letter)
        index = alphabet.reverse.find_index(letter)
        alphabet.reverse.rotate(@shift_keys.shift_a_amount)[index]
      else
        letter
      end
    end
  end

  def decrypt_shift_b
    shift_b_letters.map do |letter|
      if alphabet.include?(letter)
        index = alphabet.reverse.find_index(letter)
        alphabet.reverse.rotate(@shift_keys.shift_b_amount)[index]
      else
        letter
      end
    end
  end

  def decrypt_shift_c
    shift_c_letters.map do |letter|
      if alphabet.include?(letter)
        index = alphabet.reverse.find_index(letter)
        alphabet.reverse.rotate(@shift_keys.shift_c_amount)[index]
      else
        letter
      end
    end
  end

  def decrypt_shift_d
    shift_d_letters.map do |letter|
      if alphabet.include?(letter)
        index = alphabet.reverse.find_index(letter)
        alphabet.reverse.rotate(@shift_keys.shift_d_amount)[index]
      else
        letter
      end
    end
  end

  def decrypted_message
    new = decrypt_shift_a.zip(decrypt_shift_b, decrypt_shift_c, decrypt_shift_d)
    new.flatten.join
  end
end
