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

  describe '.create' do
    it 'creates bookmark' do
      described_class.create('http://bookmarked-url.co.gb')
      expect(described_class.list).to include 'http://bookmarked-url.co.gb'
    end
  end

  describe '.list' do
    it 'returns a list of bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      # Add the test data
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")

      bookmarks = described_class.list
      expect(bookmarks).to include('http://www.destroyallsoftware.com')
    end
  end
end
