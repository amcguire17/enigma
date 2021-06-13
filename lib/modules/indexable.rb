module Indexable
  def index_letters(num)
    letters = @message.each_with_index.map do |letter, index|
      if index % 4 == num
        letter
      end
    end
    letters.compact
  end

  def index_key(num1, num2)
    split_key[num1..num2].join.to_i + split_offset[num1]
  end
end
