# frozen_string_literal: true

source 'https://rubygems.org'

# JSON and I18n gem no longer supports ruby < 2.0.0
if defined?(JRUBY_VERSION)
  gem 'json'
elsif RUBY_VERSION =~ /^1/
  gem 'i18n', '~> 0.9'
  gem 'json', '~> 1.8.3'
  gem 'term-ansicolor', '~> 1.3.0'
  gem 'tins', '~> 1.6.0'
end

gem 'byebug'
gem 'rubocop'

gemspec
