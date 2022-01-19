require 'sinatra'
require 'sinatra/reloader'
require_relative 'lib/space'
require 'sinatra/flash'

class MakersBnB < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    also_reload './lib/space'
  end

  get ('/') do
    'Welcome to Makers BnB'
  end

  get ('/users/new') do
    erb :'users/new'
  end

  get ('/spaces/new') do
    erb :'spaces/new'
  end

  get ('/spaces/list') do
    @spaces = Space.all

    erb :'spaces/list'
  end

  post ('users') do
    # takes the users info params and does stuff
    redirect ('/spaces/list')
  end

  post ('/spaces') do
    #Next code is currently not working, needs work
    #flash[:notice] = "Your space info is NOT complete!" unless 
    Space.create(name: params[:name], short_description: params[:short_description], price: params[:price], date_from: params['date_from'], date_to: params['date_to'])
    redirect ('/spaces/list')
  end

  run if app_file == $0

end