require 'date'

module CNB
  class DailyRates < Base
    def rate_for(currency, date = Date.today)
      normalized_date = normalize_date(date)
      fail DateTooOld if max_past(normalized_date, CNB::DAILY_MAX_PAST)
      super(currency, normalized_date)
    end

    private

    def url_for(date)
      CNB::DAILY_URL + date.strftime('%d.%m.%Y')
    end
  end
end
