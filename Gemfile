source 'https://rubygems.org'

ruby '3.0.0'

gem 'pg'
gem 'sinatra'
gem 'sinatra-contrib'

gem 'twilio-ruby', '~> 5.58', '>= 5.58.3'
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
