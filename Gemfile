source 'https://rubygems.org'

ruby '3.0.0'

gem 'pg'
gem 'sinatra', '>= 2.2.0'
gem 'sinatra-contrib', '>= 2.2.0'
gem "bcrypt"
gem 'sinatra-flash'

gem 'twilio-ruby', '~> 5.60', '>= 5.60.0'
gem 'dotenv-rails', groups: [:development, :test]
gem 'dotenv-rails', require: 'dotenv/rails-now'

group :test do
  gem 'rspec'
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
  gem "capybara", require: false
end

group :development, :test do
  gem 'rubocop', '1.20'
end
