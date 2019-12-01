require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base

  get '/'do
  'Bookmark Manager'
end

get '/bookmarks'do
@bookmarks = Bookmark.all
erb(:bookmarks)

end

get '/add_bookmarks' do
  erb (:add_bookmarks)
end

post '/collect_url' do
  Bookmark.adding_url(url: params[:url], title: params[:title])
  redirect('/bookmarks')
end

run! if app_file == $0

end
