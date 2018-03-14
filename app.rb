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
    if params['new_url'] =~ /\A#{URI::regexp(['http', 'https'])}\z/
      Link.add(url: params[:new_url])
    else
      flash[:notice] = "Invalid URL, not added! :-("
    end

    redirect '/'
  end

  run! if app_file == $0

end
