source 'https://rubygems.org'

ruby '3.0.0'

gem 'pg'
gem 'sinatra'
gem 'sinatra-contrib'
gem "bcrypt"
gem 'sinatra-flash'

group :test do
  gem 'rspec'
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
  gem "capybara", require: false
end

group :development, :test do
  gem 'rubocop', '1.20'
end
