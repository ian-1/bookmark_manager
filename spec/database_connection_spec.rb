require 'database_connection'

describe DatabaseConnection do
  describe '.setup' do
    it 'sets up a connection to a database through PG' do
      allow(PG).to receive(:connect)

      described_class.setup('bookmark_manager_test')
      expect(PG).to have_received(:connect).with(dbname: 'bookmark_manager_test')
    end
  end

  describe '.connection' do
    it 'is a persistent connection' do
      # Grab the connection as a return value from the .setup method
      connection = described_class.setup('bookmark_manager_test')

      expect(described_class.connection).to eq connection
    end
  end

  describe '.query' do
    it 'executes a query via PG' do
      connection = described_class.setup('bookmark_manager_test')
      allow(connection).to receive(:exec)

      described_class.query('SELECT * FROM bookmarks;')
      expect(connection).to have_received(:exec).with('SELECT * FROM bookmarks;')
    end
  end
end
