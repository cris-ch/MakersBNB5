require 'sinatra'
require 'sinatra/reloader'

class MakersBnB < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end
  enable :sessions
  get ('/') do
    'Welcome to Makers BnB'
  end

  get ('/spaces/new') do
    erb :'spaces/new'
  end

  get ('/spaces/list') do
    @name = session[:rental_name]
    erb :'spaces/list'
  end

  post ('/spaces') do
   
    session[:rental_name] = params['name']
    
    redirect ('/spaces/list')
  end

  run if app_file == $0

end