require './lib/modules/Indexable'

class Message
  include Indexable

  attr_reader :message

  def initialize(message, shift)
    @message = message.split('')
    @shift = shift
  end

  def shift_a_letters
    index_letters(0)
  end

  def shift_b_letters
    index_letters(1)
  end

  def shift_c_letters
    index_letters(2)
  end

  def shift_d_letters
    index_letters(3)
  end

  def combined_end_message
    [26, 4, 13, 3].zip(@message.last(4))
  end
end
