require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'simplecov'
require 'simplecov-console'
require_relative 'setup_test_database'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
                                                                 SimpleCov::Formatter::Console,
                                                                 SimpleCov::Formatter::HTMLFormatter
                                                               ])
SimpleCov.start

ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', 'app.rb')

Capybara.app = BookmarkManager

RSpec.configure do |config|
  config.before(:each) do
    setup_test_database
  end
end
