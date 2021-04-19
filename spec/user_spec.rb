require 'user'

describe User do
  subject(:user) {described_class.new}
  let(:bookmark1) {double :bookmark1}
  let(:bookmark2) {double :bookmark2}
  it 'add an bookmark to a list' do
    user.add(bookmark1)
    user.add(bookmark2)
    expect(user.list).to eq([bookmark1, bookmark2])
  end
end