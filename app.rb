require 'sinatra/base'
require 'sinatra/flash'
require './database_connection_setup'
require './lib/link'
require 'uri'

class BookmarkManager < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    @links = Link.all
    erb :index
  end

  post '/url' do
    flash[:notice] = 'Invalid URL, not added! :-(' unless Link.add(url: params['new_url'], title: params['title'])
    redirect '/'
  end

  post '/delete-link' do
    Link.delete(params['id'])
    redirect '/'
  end

  get '/update-link' do
    erb :update-link
  end

  run! if app_file == $0

end
