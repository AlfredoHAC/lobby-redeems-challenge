source "https://rubygems.org"

ruby "3.2.3"

gem "rails", "~> 7.1.3"
gem "sqlite3", "~> 1.4"
gem "puma", ">= 5.0"
gem "tzinfo-data", platforms: %i[ windows jruby ]
gem "bootsnap", require: false
gem "rubocop"
gem "active_model_serializers"

group :development, :test do
  gem "debug", platforms: %i[ mri windows ]
end

group :test do
  gem 'minitest-spec-rails'
  gem 'factory_bot_rails'
  gem 'faker'
end
