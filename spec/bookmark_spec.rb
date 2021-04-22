require 'bookmark'

describe Bookmark do
  subject(:bookmark) { described_class.new('Makers', 'http://makers.tech') }

  describe '#title' do
    it 'return the title' do
      expect(bookmark.title).to eq 'Makers'
    end
  end

  describe '#url' do
    it 'return the url' do
      expect(bookmark.url).to eq 'http://makers.tech'
    end
  end

  describe '.create' do
    it 'creates bookmark with title' do
      described_class.create('New URL', 'http://bookmarked-url.co.gb')
      expect(described_class.list[-1].title).to eq 'New URL'
    end

    it 'creates bookmark with url' do
      described_class.create('New URL', 'http://bookmarked-url.co.gb')
      expect(described_class.list[-1].url).to eq 'http://bookmarked-url.co.gb'
    end
  end

  describe '.list' do
    it 'returns a list of bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      # Add the test data
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")

      bookmarks = described_class.list
      expect(bookmarks[-1].url).to include('http://www.destroyallsoftware.com')
    end
  end
end
