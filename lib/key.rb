require './lib/modules/Indexable'
require './lib/modules/crackable'

class Key
  include Indexable
  include Crackable

  attr_reader :key, :offset

  def initialize(key, offset, shift)
    @key = key == 0 ? (random_key) : (key)
    @offset = offset == 0 ? (date_today) : (offset)
    @shift = shift
  end

  def random_key
    key = (0..9).to_a.sample(5).join
  end

  def date_today
    Date.today.strftime('%d%m%y')
  end

  def split_key
    @key.split('').map do |num|
      num.to_i
    end
  end

  def square_offset
    @offset.to_i ** 2
  end

  def split_offset
    square_offset.to_s.split('').last(4).map do |num|
      num.to_i
    end
  end

  def shift_a_amount
    index_key(0, 1)
  end

  def shift_b_amount
    index_key(1, 2)
  end

  def shift_c_amount
    index_key(2, 3)
  end

  def shift_d_amount
    index_key(3, 4)
  end

  def crack_rotate_for_shift
    @shift.crack_end_message_shift.rotate(4 - @shift.shift_message.message.length % 4)
  end

  def crack_shift_a_key
    sub_shift_from_offset(0)
  end

  def crack_shift_b_key
    sub_shift_from_offset(1)
  end

  def crack_shift_c_key
    sub_shift_from_offset(2)
  end

  def crack_shift_d_key
    sub_shift_from_offset(3)
  end

  def crack_a_key
    crack_shift_a_key.join
  end

  def crack_b_key
    calc_keys_to_combine(crack_shift_a_key, crack_shift_b_key)
  end

  def crack_c_key
    calc_keys_to_combine(crack_shift_b_key, crack_shift_c_key)
  end

  def crack_d_key
    crack_shift_d_key[1]
  end

  def crack_key
    @key = crack_a_key + crack_b_key + crack_c_key + crack_d_key
  end
end
