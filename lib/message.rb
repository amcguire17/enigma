require './lib/modules/Indexable'

class Message
  include Indexable

  def initialize(message)
    @message = message.split('')
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
end
