require_relative 'cnb/currency_rates'
require_relative 'cnb/daily_rates'
require_relative 'cnb/monthly_rates'

module CNB
  PRIMARY_CURRENCY = 'CZK'

  class << self
    def daily_rates
      @parser = DailyRates.new
    end

    def monthly_rates(month, year)
      @parser = MonthlyRates.new(month, year)
    end

    def date
      parser.date
    end

    def rate(cur_code)
      parser.rate(cur_code)
    end

    def name(cur_code)
      parser.name(cur_code)
    end

    def country(cur_code)
      parser.country(cur_code)
    end

    private

    def parser
      @parser ||= DailyRates.new
    end
  end
end
