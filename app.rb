require 'sinatra'
require 'sinatra/reloader'
require './lib/bookmark'
class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  get '/bookmarks' do
    @list1 = Bookmark.new('Makers', 'http://makers.tech')
    @list2 = Bookmark.new('Makers', 'http://makers.tech')
    @list3 = Bookmark.new('Makers', 'http://makers.tech')
    @list = [@list1, @list2, @list3]
    erb :bookmarks
  end

  run! if app_file == $PROGRAM_NAME
end
