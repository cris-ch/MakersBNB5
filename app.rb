require 'sinatra'
require 'sinatra/reloader'
require './lib/space'

class MakersBnB < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    also_reload './lib/space'
  end

  enable :sessions

  get ('/') do
    'Welcome to Makers BnB'
  end

  get ('/spaces/new') do
    erb :'spaces/new'
  end

  get ('/spaces/list') do
    @name = Space.all
    erb :'spaces/list'
  end

  post ('/spaces') do
    Space.create(name: params['name'])
    redirect ('/spaces/list')
  end

  run if app_file == $0

end