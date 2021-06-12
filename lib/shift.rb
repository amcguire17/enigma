class Shift
  def initialize(message, key, date)
    @message = message
    @key = key
    @date = date
  end
  def alphabet
    ('a'..'z').to_a << ' '
  end
  def shift_offset
    exp = @date.to_i ** 2
    last = exp.to_s.split('').last(4)
    last.map do |num|
      num.to_i
    end
  end

  def shift_key
    key_array = @key.split('').map do |num|
      num.to_i
    end
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
    shift_amount = shift_key[0..1].join.to_i + shift_offset[0]
    shift_a_letters.map do |letter|
      index = alphabet.find_index(letter)
      alphabet.rotate(shift_amount)[index]
    end
  end

  def encrypt_shift_b
    shift_amount = shift_key[1..2].join.to_i + shift_offset[1]
    shift_b_letters.map do |letter|
      index = alphabet.find_index(letter)
      alphabet.rotate(shift_amount)[index]
    end
  end

  def encrypt_shift_c
    shift_amount = shift_key[2..3].join.to_i + shift_offset[2]
    shift_c_letters.map do |letter|
      index = alphabet.find_index(letter)
      alphabet.rotate(shift_amount)[index]
    end
  end

  def encrypt_shift_d
    shift_amount = shift_key[3..4].join.to_i + shift_offset[3]
    shift_d_letters.map do |letter|
      index = alphabet.find_index(letter)
      alphabet.rotate(shift_amount)[index]
    end
  end

  def encrypted_message
    new = encrypt_shift_a.zip(encrypt_shift_b, encrypt_shift_c, encrypt_shift_d)
    new.flatten.join
  end
end
