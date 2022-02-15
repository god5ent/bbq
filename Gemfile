source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

gem 'rails', '~> 6.1.4', '>= 6.1.4.1'

gem 'devise'
gem 'puma', '~> 5.0'
gem 'webpacker', '~> 5.0'
gem 'uglifier'

gem 'rails-i18n', '~> 6'
gem 'devise-i18n'
gem 'http_accept_language'
gem 'bootsnap', '>= 1.4.4', require: false
gem "validate_url"

group :production do
  gem 'pg'
end

group :development, :test do
  gem 'sqlite3', '~> 1.4'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 4.1.0'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
end