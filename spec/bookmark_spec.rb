require 'bookmark'

describe BookMark do 
  subject(:bookmark) {described_class.new('Makers', 'http://makers.tech')}
  
  describe '#name' do
    it 'return the name' do 
      expect(bookmark.name).to eq 'Makers'
    end
  end
  
  describe '#url' do
    it 'return the url' do
      expect(bookmark.url).to eq 'http://makers.tech'
    end
  end

end