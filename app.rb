require 'sinatra'
require 'sinatra/reloader'
require_relative './lib/space'
require_relative './lib/user'
require 'sinatra/flash'

class MakersBnB < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    also_reload './lib/space'
    also_reload './lib/space'
  end

  enable :sessions

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
    @user = User.find(email: session[:user_email])
    @spaces = Space.all
    erb :'spaces/list'
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post ('/users') do
    user = User.create(name: params['name'], email: params['email'], password: params['password'])
    session[:user_email] = user.email
    redirect ('/spaces/list')
  end

  post ('/spaces') do
    #Next code is currently not working, needs work
    #flash[:notice] = "Your space info is NOT complete!" unless 
    Space.create(name: params[:name], short_description: params[:short_description], price: params[:price], date_from: params['date_from'], date_to: params['date_to'])
    redirect ('/spaces/list')
  end

  post ('/sessions') do
    user = User.authenticate(email: params[:email], password: params[:password])
    session[:user_email] = user.email
    redirect ('/spaces/list')
  end

  run if app_file == $0

end