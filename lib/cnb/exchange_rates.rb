require 'nokogiri'
require 'open-uri'

module CNB
  class ExchangeRates
    def rate_for(currency, date, monthly)
      rates_for(date, monthly)
      rate = @source.at_css("radek[kod='#{currency}']")

      fail CurrencyNotSupported if rate.nil?

      rate.attr('kurz').tr(',', '.').to_f
    end

    def rates_for(date, monthly)
      if @source.nil? || (@source && !match_parsed_date?(date))
        @source = source_for(date, monthly)
      end

      @source
    end

    private

    def url_for(date, monthly = false)
      if monthly
        CNB::MONTHLY_URL + date.strftime('%m') + CNB::MONTHLY_SEP + date.strftime('%Y')
      else
        CNB::RATES_URL + date.strftime('%d.%m.%Y')
      end
    end

    def source_for(date, monthly)
      if monthly
        @source = Nokogiri::XML(open(url_for(date, true)))
      else
        @source = Nokogiri::XML(open(url_for(date)))
      end
    end

    def match_parsed_date?(date)
      @source ? Date.parse(@source.at_css('kurzy').attr('datum')) == date : nil
    end
  end
end
