source 'https://rubygems.org'

ruby '3.1.0'

gem 'rake'
gem 'hanami',         '~> 1.3'
gem 'hanami-model',   '~> 1.3'
gem 'sprockets',      '~> 4.0'
gem 'jquery-hanami',  '~> 0.1'

gem 'pg'

gem 'bigdecimal', '~> 1.4' # monkey patch since ruby-2.7.0 removes BigDecimal.new


group :development do
  # Code reloading
  # See: https://guides.hanamirb.org/projects/code-reloading
  gem 'pry-byebug'
  gem 'shotgun', platforms: :ruby
  gem 'hanami-webconsole'
end

group :test, :development do
  gem 'dotenv', '~> 2.4'
end

group :test do
  gem 'rspec'
  gem 'capybara'
end

group :production do
  # gem 'puma'
end
