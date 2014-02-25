require_relative 'cnb/load_config'
require_relative 'cnb/cur_rates_parser'
require_relative 'cnb/daily_cur_rates_parser'
require_relative 'cnb/monthly_cur_rates_parser'

module CNB
  PRIMARY_CURRENCY = 'CZK'

  class << self
    def daily_rates
      @parser = DailyCurRatesParser.new
    end

    def monthly_rates(month, year)
      @parser = MonthlyCurRatesParser.new(month, year)
    end

    def date
      @parser.date
    end

    def rate(cur_code)
      @parser.rate(cur_code)
    end

    def name(cur_code)
      @parser.name(cur_code)
    end

    def country(cur_code)
      @parser.country(cur_code)
    end
  end
end
