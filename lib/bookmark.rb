require 'pg'

class Bookmark
  attr_reader :id, :title, :url

  def initialize(id, title, url)
    @id = id
    @title = title
    @url = url
  end

  class << self
    def list
      result = psql('SELECT * FROM bookmarks;')
      result.map do |bookmark|
        p bookmark
        Bookmark.new(bookmark['id'], bookmark['title'], bookmark['url'])
      end
    end

    def create(title, url)
      psql("INSERT INTO bookmarks (title, url) VALUES ('#{title}', '#{url}');")
    end

    def delete(id)
      psql("DELETE FROM bookmarks WHERE id = #{id}")
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
