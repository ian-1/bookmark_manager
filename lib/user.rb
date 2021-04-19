class User
  attr_reader :list
  def initialize
   @list = []   
  end

  def add(bookmark)
    @list << bookmark
  end
end