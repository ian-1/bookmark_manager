require 'pg'

class Bookmark
  attr_reader :id, :title, :url

  def initialize(id, title, url)
    @id = id
    @title = title
    @url = url
  end

  def update(new_values)
    new_values.each do |key, value|
      Bookmark.psql("UPDATE bookmarks SET #{key} = '#{value}' WHERE id = #{@id};") unless value == ''
    end
  end

  class << self
    def list
      result = psql('SELECT * FROM bookmarks;')
      result.map do |bookmark|
        Bookmark.new(bookmark['id'], bookmark['title'], bookmark['url'])
      end
    end

    def find_bookmark(id)
      bookmark = psql("SELECT * FROM bookmarks WHERE id = #{id};")
      Bookmark.new(bookmark[0]['id'], bookmark[0]['title'], bookmark[0]['url'])
    end

    def create(title, url)
      psql("INSERT INTO bookmarks (title, url) VALUES ('#{title}', '#{url}');")
    end

    def delete(id)
      psql("DELETE FROM bookmarks WHERE id = #{id}")
    end

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
