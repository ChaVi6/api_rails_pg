source "https://rubygems.org"

ruby "3.4.9"

gem "rails", "~> 7.1.6"

gem "pg", "~> 1.5"

gem "puma", ">= 5.0"

gem "active_model_serializers", "~> 0.10.14"

gem "activerecord-reset-pk-sequence"

gem "tzinfo-data", platforms: %i[ windows jruby ]

# Кэширование
gem "bootsnap", require: false

group :development, :test do
  gem "debug", platforms: %i[ mri windows ]
  gem "byebug", platform: :mri

  gem "better_errors"
  gem "binding_of_caller"

  gem "rspec-rails", "~> 6.0"
  gem "factory_bot_rails"
  gem "faker"
  gem "database_cleaner-active_record"

  gem "rubocop", require: false
  gem "rubocop-rspec", require: false
end

group :development do
  gem "listen", "~> 3.8"
end

group :test do
  gem "simplecov", require: false
end