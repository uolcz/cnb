module CNB
  class MonthlyRates < Base
    def rate_for(currency, date = Date.today)
      normalized_date = normalize_date(date)
      fail DateTooOld if normalized_date.year < (Date.today.year - CNB::MONTHLY_MAX_PAST)
      super(currency, normalized_date)
    end

    private

    def url_for(date)
      CNB::BASE_URL + CNB::MONTHLY + date.strftime('%m') +
        CNB::MONTHLY_SEP + date.strftime('%Y')
    end
  end
end
