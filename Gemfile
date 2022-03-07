source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.0"
gem "rails", "~> 6.1.4.4"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"

#for safety measurements
gem 'dotenv-rails'
gem 'listen'
gem 'rails-i18n'
#Rails json serializer gem
gem 'active_model_serializers', '~> 0.10.0'

#authentication gem
gem 'devise'
gem 'devise_token_auth', '~> 1.2'

#cancancan for access control
gem 'cancancan'
gem 'domainatrix'

# Rolify gem for users's role management
gem "rolify"

# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false
gem 'rack-cors'

#Scrapping related gems
gem 'httparty'
gem 'nokogiri'

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem 'pry'
  gem 'pry-rails'
  gem 'rails-erd'
  #deployment gems
  gem 'capistrano',         require: false
  gem 'capistrano-rvm',     require: false
  gem 'capistrano-rails',   require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano-dotenv', require: false
  gem 'capistrano-passenger'
  gem 'capistrano-linked-files', require: false


end

