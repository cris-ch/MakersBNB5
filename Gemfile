# frozen_string_literal: true

source "https://rubygems.org"

ruby '3.0.2'

gem 'sinatra'
gem 'sinatra-contrib'
gem 'rack'
gem 'capybara'
gem 'rspec'
gem 'pg'
gem 'flash'
gem 'puma'
gem 'sinatra-flash'

group :test do
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
end

group :development, :test do
  gem 'rubocop', '1.20'
end
