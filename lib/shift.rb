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
end
