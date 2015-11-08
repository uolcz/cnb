require 'date'

module CNB
  class Application
    attr_reader :rates

    def initialize
      @rates = ExchangeRates.new
    end

    def exchange_rate(currency, date = Date.today, monthly = false)
      normalized_date = normalize_date(date)

      fail DateTooOld      if normalized_date.year < max_past(monthly)
      fail DateInFuture    if normalized_date > Date.today
      fail CurrencyMissing unless currency

      @rates.rate_for(currency.upcase, normalized_date, monthly)
    end

    private

    def max_past(monthly)
      monthly ? Date.today.year - 10 : Date.today.year - 24
    end

    def normalize_date(date)
      date.is_a?(Date) ? date : Date.parse(date)
    end
  end
end
