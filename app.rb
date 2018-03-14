require 'sinatra/base'
require './lib/link'

class BookmarkManager < Sinatra::Base
  get '/' do
    @links = Link.all
    erb :index
  end

  post '/url' do
    Link.add(url: params[:new_url])
    p params[:new_url]
    redirect '/'
  end

  run! if app_file == $0

end
