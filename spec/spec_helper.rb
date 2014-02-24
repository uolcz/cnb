require 'rubygems'

# COVERAGE=true rspec
if ENV['COVERAGE']
  require 'simplecov'
  SimpleCov.start
end

require 'cnb/load_config'
require 'cnb/cur_rates_parser'
require 'cnb/daily_cur_rates_parser'
require 'cnb/monthly_cur_rates_parser'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[File.join('spec/support/**/*.rb')].each { |f| require f }

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    # disable the `should` syntax
    c.syntax = :expect
  end
end
