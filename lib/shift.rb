class Shift
  def initialize(message, key, date)
    @message = decrypt_message
    @key = key
    @dte = date
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

  def shift_a
  end

  def shift_b
  end

  def shift_c
  end

  def shift_d
  end
end
