module CNB
  class DailyRates < CurrencyRates
    def initialize
      @currencies = {}
      @cur_rates_url = "#{CUR_RATES_URL}kurzy_devizoveho_trhu/denni_kurz.xml"

      get_currencies
    end
  end
end
