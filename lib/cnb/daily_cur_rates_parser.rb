module CNB
  class DailyCurRatesParser < CurRatesParser
    def initialize
      @currencies = {}
      @cur_rates_url = "#{CUR_RATES_URL}kurzy_devizoveho_trhu/denni_kurz.txt"
      @cur_rates_filepath = "#{CONFIG['exchange_rates_dir']}/daily_cur_rates.txt"

      parse
    end

    private

    def parse
      if File.exist?(@cur_rates_filepath)
        download_cur_rates(@cur_rates_url) unless parse_date(@cur_rates_filepath) == Date.today
      else
        download_cur_rates(@cur_rates_url)
      end

      super(@cur_rates_filepath)
    end
  end
end
