source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.7'
# Use mysql as the database for Active Record
gem 'mysql2'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

gem 'devise'
gem 'russian' # russian lang
gem 'kaminari' # paginations
gem 'mini_magick' # image processing
gem 'carrierwave' # file upload
gem 'aasm' # state machine
gem 'airbrake' # errbit notifications
gem 'bootstrap-sass', '~> 3.2.0' # bootstrap
gem 'autoprefixer-rails' # css prefixer

gem 'acts-as-taggable-on' # tags for Post
gem 'metamagic' # meta keywords and description
gem 'nprogress-rails'
gem 'video_info'
gem 'annotate'

group :development do
  # gem 'mina'
  gem 'net-ssh', "~> 2.7.0"
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'sextant'
  gem 'quiet_assets'
  gem 'bullet'
end

group :production do
  gem 'unicorn'
  gem 'utf8-cleaner'
end

group :test, :development do
  gem 'spring'
  gem "rspec-rails", "~> 3.0"
  gem "factory_girl_rails", "~> 4.0"
  gem 'guard-rspec'
  gem "faker"
  gem "capybara"
  # gem 'capybara-screenshot'
  gem "database_cleaner"
end
