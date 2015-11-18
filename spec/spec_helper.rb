require 'rubygems'
require 'webmock/rspec'
require "codeclimate-test-reporter"

WebMock.disable_net_connect!(allow: "https://codeclimate.com/test_reports")
CodeClimate::TestReporter.start

# COVERAGE=true rspec
if ENV['COVERAGE']
  require 'simplecov'
  SimpleCov.start
end

require 'cnb'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[File.join('spec/support/**/*.rb')].each { |f| require f }

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    # disable the `should` syntax
    c.syntax = :expect
  end
end
