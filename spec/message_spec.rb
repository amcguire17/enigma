require './lib/message'

RSpec.describe Message do
  before(:each) do
    @message = Message.new('hello world!!!!')
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
end
