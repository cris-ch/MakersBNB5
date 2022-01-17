require 'sinatra'
require 'sinatra/reloader'

class MakersBnB < Sinatra::Base
  configure :development do
    register Sinatra::reloader
  end

  get ('/') do
    'Welcome to Makers BnB'
  end

  run if app_file == $0

end