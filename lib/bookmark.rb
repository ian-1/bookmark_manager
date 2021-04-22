require 'pg'

class Bookmark
  attr_reader :name, :url

  def initialize(name, url)
    @name = name
    @url = url
  end

  class << self
    def list
      result = psql('SELECT * FROM bookmarks;')
      result.map { |bookmark| bookmark['url'] }
    end

    def create(url)
      psql("INSERT INTO bookmarks (url) VALUES ('#{url}');")
    end

    private

    def psql(psql_command)
      connection.exec(psql_command)
    end

    def connection
      PG.connect(dbname: database)
    end

    def database
      test_environment? ? 'bookmark_manager_test' : 'bookmark_manager'
    end

    def test_environment?
      ENV['RACK_ENV'] == 'test'
    end
  end
end
