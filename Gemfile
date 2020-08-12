# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.1"

gem "bootsnap", ">= 1.4.2", require: false
gem "pg", ">= 0.18", "< 2.0"
gem "puma", "~> 4.1"
gem "rails", "~> 6.0.3", ">= 6.0.3.2"
gem "sass-rails", ">= 6"
gem "sidekiq", "~> 6.1"
gem "sanitize"
gem "gepub"
gem "rack-attack"
gem "aws-sdk-s3"
gem "final_redirect_url"
gem "nokogiri"
gem "simple_form"
gem "acts_as_list"
gem "turbolinks", "~> 5"
gem "webpacker", "~> 4.0"
gem "redis", ">= 4.0", require: ["redis", "redis/connection/hiredis"]
gem "hiredis"

group :development, :test do
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  gem "rspec-rails", "~> 4.0.1"
  gem "standard"
end

group :development do
  gem "annotate"
  gem "better_errors"
  gem "binding_of_caller"
  gem "listen", "~> 3.2"
  gem "solargraph"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end

group :test do
  gem "capybara", ">= 2.15"
  gem "selenium-webdriver"
  gem "webdrivers"
end

gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

gem "stimulus_reflex", "~> 3.2"
