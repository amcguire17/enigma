require './lib/modules/Indexable'

class Key
  include Indexable

  def initialize(key, offset)
    @key = key
    @offset = offset
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
end
