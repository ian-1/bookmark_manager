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
    @list = Bookmark.list
    erb :bookmarks
  end

  get '/bookmarks/add' do
    erb :bookmarks_add
  end

  post '/bookmarks' do
    url = params[:URL]
    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec("INSERT INTO bookmarks (url) VALUES ('#{url}');")
    redirect '/'
  end

  run! if app_file == $PROGRAM_NAME
end
