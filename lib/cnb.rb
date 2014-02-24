require_relative 'cnb/load_config'
require_relative 'cnb/cur_rates_parser'
require_relative 'cnb/daily_cur_rates_parser'
require_relative 'cnb/monthly_cur_rates_parser'

module CNB
  class CNB
    def self.daily_cur_rates
      @parser = DailyCurRatesParser.new
    end

    def self.monthly_cur_rates(month, year)
      @parser = MonthlyCurRatesParser.new(month, year)
    end

    def self.date
      @parser.date
    end

    def self.cur_rate(cur_code)
      @parser.cur_rate(cur_code)
    end

    def self.cur_name(cur_code)
      @parser.cur_name(cur_code)
    end

    def self.cur_country(cur_code)
      @parser.cur_country(cur_code)
    end
  end
end
