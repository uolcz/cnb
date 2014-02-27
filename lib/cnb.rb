require 'cnb/currency_rates'
require 'cnb/daily_rates'
require 'cnb/monthly_rates'

module CNB
  PRIMARY_CURRENCY = 'CZK'

  class << self
    def daily_rates
      DailyRates.new
    end

    def monthly_rates(month, year)
      MonthlyRates.new(month, year)
    end
  end
end
