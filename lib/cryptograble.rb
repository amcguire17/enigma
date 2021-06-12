module Cryptograble
  def encrypt_letters(shift_letters, shift_amount)
    shift_letters.map do |letter|
      if alphabet.include?(letter)
        index = alphabet.find_index(letter)
        alphabet.rotate(shift_amount)[index]
      else
        letter
      end
    end
  end

  def decrypt_letters(shift_letters, shift_amount)
    shift_letters.map do |letter|
      if alphabet.include?(letter)
        index = alphabet.reverse.find_index(letter)
        alphabet.reverse.rotate(shift_amount)[index]
      else
        letter
      end
    end
  end

  def join_shifted_letters(shift_a, shift_b, shift_c, shift_d)
    new = shift_a.zip(shift_b, shift_c, shift_d)
    new.flatten.join
  end
end
