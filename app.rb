require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base

  get '/'do
  'Bookmark Manager'
  end

  get '/add_bookmarks' do
    erb (:add_bookmarks)
  end

  post '/collect_url' do
    @new_url = params[:new_url]
    Bookmark.adding_url(@new_url)
    redirect('/bookmarks')
  end

  get '/bookmarks'do
  @bookmarks = Bookmark.all
  erb(:bookmarks)

  end



run! if app_file == $0

end
