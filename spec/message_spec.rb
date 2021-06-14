require './lib/message'

RSpec.describe Message do
  before(:each) do
    @shift = Shift.new('hello world!!!!', '02715', '040895')
    @message = Message.new('hello world!!!!', @shift)
  end

  it 'exists' do
    expect(@message).to be_a(Message)
  end

  it 'can return letters by shift' do
    expect(@message.shift_a_letters).to eq(['h', 'o', 'r', '!'])
    expect(@message.shift_b_letters).to eq(['e', ' ', 'l', '!'])
    expect(@message.shift_c_letters).to eq(['l', 'w', 'd', '!'])
    expect(@message.shift_d_letters).to eq(['l', 'o', '!'])
  end

  it "can return ' end' index combined with encrypted end to find key" do
    message = Message.new('vjqtbeaweqihssi', @shift)
    expect(message.combined_end_message).to eq([[26, 'h'], [4, 's'], [13, 's'], [3, 'i']])
  end
end
