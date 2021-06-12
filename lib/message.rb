class Message
  def initialize(message)
    @message = message.split('')
  end

  def shift_a_letters
    letters = @message.each_with_index.map do |letter, index|
      if index % 4 == 0
        letter
      end
    end
    letters.compact
  end

  def shift_b_letters
    letters = @message.each_with_index.map do |letter, index|
      if index % 4 == 1
        letter
      end
    end
    letters.compact
  end

  def shift_c_letters
    letters = @message.each_with_index.map do |letter, index|
      if index % 4 == 2
        letter
      end
    end
    letters.compact
  end

  def shift_d_letters
    letters = @message.each_with_index.map do |letter, index|
      if index % 4 == 3
        letter
      end
    end
    letters.compact
  end
end
