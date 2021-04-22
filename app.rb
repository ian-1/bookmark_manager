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
    @title = params[:Title]
    @url = params[:URL]
    Bookmark.create(@title, @url)
    redirect '/'
  end

  run! if app_file == $PROGRAM_NAME
end
