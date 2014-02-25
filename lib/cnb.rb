require_relative 'cnb/load_config'
require_relative 'cnb/cur_rates_parser'
require_relative 'cnb/daily_cur_rates_parser'
require_relative 'cnb/monthly_cur_rates_parser'

module CNB
  class CNB
    def self.daily_rates
      @parser = DailyCurRatesParser.new
    end

    def self.monthly_rates(month, year)
      @parser = MonthlyCurRatesParser.new(month, year)
    end

    def self.date
      @parser.date
    end

    def self.rate(cur_code)
      @parser.rate(cur_code)
    end

    def self.name(cur_code)
      @parser.name(cur_code)
    end

    def self.country(cur_code)
      @parser.country(cur_code)
    end
  end
end
