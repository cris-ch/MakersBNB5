require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/flash'
require_relative 'lib/booking'
require_relative './lib/space'
require_relative './lib/user'


class MakersBnB < Sinatra::Base
  enable :sessions
  register Sinatra::Flash 
  configure :development do
    register Sinatra::Reloader
    also_reload './lib/space'
    also_reload './lib/booking'
    also_reload './lib/user'
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

  get ('/spaces/booking') do
    @booking_request  =  session[:booking]
    erb :'spaces/booking'
  end

  post ('/spaces/booking') do
    # session[:booking] = [params['name'], params['stay_date']]
    # session[:booking] = Booking.create(params['name'], params['stay_date'])
    session[:booking] = Booking.create(property_name: params['name'], stay_date: params['stay_date'])
    redirect ('/spaces/booking')
  end 

  post ('/sessions') do
    user = User.authenticate(email: params[:email], password: params[:password])

    if user
    session[:user_email] = user.email
    redirect ('/spaces/list')

    else 
      flash[:notice] = 'Please check your email or password'
      redirect ('/sessions/new')
    end
  end 

  post ('/sessions/destroy') do
    session.clear
    flash[:notice] = "You have signed out."
    redirect ('/spaces/list')
  end

  get ('/spaces/approve') do
    @booking_request  =  session[:booking]
    erb :'spaces/approve'
  end

  get ('/spaces/booking_approved') do
    @booking_request  =  session[:booking]
    erb :'spaces/booking_approved'
  end

  post ('/spaces/approval') do
    redirect ('/spaces/booking_approved')
  end

  run if app_file == $0

end