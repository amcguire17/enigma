module Crackable
  def sub_shift_from_offset(num)
    (crack_rotate_for_shift[num] - split_offset[num]).to_s.rjust(2, '0').split('')
  end

  def calc_keys_to_combine(key1, key2)
    amount = (27 - ((key1[1].to_i * 10) % 27)) + key2.join.to_i
    if amount > 9
      (10 - amount).to_s
    else
      amount.to_s
    end
  end
end
