require 'pg'

class Bookmark
  @list = []
  attr_reader :name, :url

  def initialize(name, url)
    @name = name
    @url = url
  end

  def self.list
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end

    result = connection.exec("SELECT * FROM bookmarks;")
    result.map { |bookmark| bookmark['url'] }
  end

  # def self.update_list(bookmark)
  #   @list << bookmark
  # end
end
