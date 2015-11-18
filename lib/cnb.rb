require 'date'
require 'cnb/version'
require 'cnb/config'
require 'cnb/base'
require 'cnb/daily_rates'
require 'cnb/monthly_rates'

# The main interface to CNB rates.
module CNB
  class DateTooOld < StandardError; end
  class DateInFuture < StandardError; end
  class CurrencyMissing < StandardError; end
  class CurrencyNotSupported < StandardError; end

  # Returns float with daily rate for given currency and date.
  def self.daily_rate(currency, date = Date.today)
    daily_rates = DailyRates.new
    daily_rates.rate_for(currency, date)
  end

  # Returns float with monthly rate for given currency and date.
  def self.monthly_rate(currency, date = Date.today)
    monthly_rates = MonthlyRates.new
    monthly_rates.rate_for(currency, date)
  end
end
