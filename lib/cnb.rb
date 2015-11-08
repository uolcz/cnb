require 'cnb/version'
require 'cnb/config'
require 'cnb/application'
require 'cnb/exchange_rates'

# The main interface to CNB rates.
module CNB
  class DateTooOld < StandardError; end
  class DateInFuture < StandardError; end
  class CurrencyMissing < StandardError; end
  class CurrencyNotSupported < StandardError; end

  # Returns float with rate for given currency and date.
  def self.exchange_rate(currency, date = Date.today, monthly = false)
    app = Application.new
    app.exchange_rate(currency, date, monthly)
  end
end
