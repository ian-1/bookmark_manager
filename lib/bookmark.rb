class Bookmark
  @list = []
  attr_reader :name, :url

  def initialize(name, url)
    @name = name
    @url = url
  end

  def self.list
    @list
  end

  def self.update_list(bookmark)
    @list << bookmark
  end
end
