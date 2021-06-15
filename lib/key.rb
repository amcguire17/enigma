require './lib/modules/indexable'
require './lib/modules/calculatable'

class Key
  include Indexable
  include Calculatable

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

  def crack_shift_a_sub_offset
    sub_shift_from_offset(0)
  end

  def crack_shift_b_sub_offset
    sub_shift_from_offset(1)
  end

  def crack_shift_c_sub_offset
    sub_shift_from_offset(2)
  end

  def crack_shift_d_sub_offset
    sub_shift_from_offset(3)
  end

  def crack_shift_a_key_options
    crack_key_options(crack_shift_a_sub_offset)
  end

  def crack_shift_b_key_options
    crack_key_options(crack_shift_b_sub_offset)
  end

  def crack_shift_c_key_options
    crack_key_options(crack_shift_c_sub_offset)
  end

  def crack_shift_d_key_options
    crack_key_options(crack_shift_d_sub_offset)
  end

  def compare_shifts
     if find_common(crack_shift_a_key_options, crack_shift_b_key_options).length == 1
       {b: find_common(crack_shift_a_key_options, crack_shift_b_key_options).flatten}
     elsif find_common(crack_shift_b_key_options, crack_shift_c_key_options).length == 1
       {c: find_common(crack_shift_b_key_options, crack_shift_c_key_options).flatten}
     elsif find_common(crack_shift_c_key_options, crack_shift_d_key_options).length == 1
       {d: find_common(crack_shift_c_key_options, crack_shift_d_key_options).flatten}
     end
  end

  def crack_key
    if compare_shifts[:b] != nil
      a = crack_shift_a_key_options.select do |num1, num2|
        num2 == compare_shifts[:b][0]
      end.flatten
      b = compare_shifts[:b]
      c = crack_shift_c_key_options.select do |num1, num2|
        num1 == compare_shifts[:b][1]
      end.flatten
      d = crack_shift_d_key_options.select do |num1, num2|
        num1 == c[1]
      end.flatten
      @key = a.join + b[1] + c[1] + d[1]
    elsif compare_shifts[:c] != nil
      b = crack_shift_b_key_options.select do |num1, num2|
        num2 == compare_shifts[:c][0]
      end.flatten
      c = compare_shifts[:c]
      d = crack_shift_d_key_options.select do |num1, num2|
        num1 == compare_shifts[:c][1]
      end.flatten
      a = crack_shift_a_key_options.select do |num1, num2|
        num2 == b[0]
      end.flatten
      @key = a.join + b[1] + c[1] + d[1]
    elsif compare_shifts[:d] != nil
      c = crack_shift_c_key_options.select do |num1, num2|
        num2 == compare_shifts[:d][0]
      end.flatten
      d = compare_shifts[:d]
      b = crack_shift_b_key_options.select do |num1, num2|
        num2 == c[0]
      end.flatten
      a = crack_shift_a_key_options.select do |num1, num2|
        num2 == b[0]
      end.flatten
      @key = a.join + b[1] + c[1] + d[1]
    end
  end
end
