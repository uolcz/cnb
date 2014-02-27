module CNB
  class MonthlyRates < CurrencyRates
    def initialize(month, year)
      @month = month
      @year = year

      raise 'Invalid month given' unless valid_month?
      raise 'Invalid year given' unless valid_year?

      @currencies = {}
      @cur_rates_url = "#{CUR_RATES_URL}/kurzy_ostatnich_men/kurzy.xml?mesic=#{month}&rok=#{year}"

      get_currencies
    end

    private

    def valid_month?
      @month.to_i >= 1 && @month.to_i <= 12
    end

    def valid_year?
      @year.to_i >= 2004 && @year.to_i <= Time.now.year
    end
  end
end
