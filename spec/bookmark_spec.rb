require 'bookmark'

describe Bookmark do
  subject(:bookmark) { described_class.new('Makers', 'http://makers.tech') }

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

  describe '.update' do
    it 'updates list' do
      described_class.update_list(bookmark)
      expect(described_class.list[-1].url).to eq "http://makers.tech"
    end
  end

  describe '.list' do
    it 'returns a list of bookmarks' do
      bookmarks = Bookmark.list
      expect(bookmarks[-1].url).to include "http://makers.tech"
    end
  end
end
