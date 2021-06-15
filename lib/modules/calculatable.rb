module Calculatable
  def sub_shift_from_offset(num)
    (crack_rotate_for_shift[num] - split_offset[num])
  end

  def crack_key_options(shift)
    x = [0, 1, 2, 3]
    x.map do |num|
      if shift + (num * 27) < 0
        0
      else
        (shift + (num * 27)).to_s.rjust(2, '0').split('')
      end
    end
  end

  def find_common(x, y)
    arr = []
    x.each do |num1, num2|
      y.each do |num3, num4|
        if num2 == num3
          arr << [num3, num4]
        end
      end
    end
    arr
  end
end
