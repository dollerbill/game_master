source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.0'

gem 'discordrb', git: 'https://github.com/shardlab/discordrb.git', ref: 'main'
gem 'dotenv-rails'
gem 'faker', git: 'https://github.com/faker-ruby/faker.git', ref: 'main'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rails', '~> 6.1.7'

group :development, :test do
  gem 'pry-byebug'
end

group :development do
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'rubocop'
  gem 'web-console', '>= 4.1.0'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
