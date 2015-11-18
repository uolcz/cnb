
require 'nokogiri'
require 'open-uri'

module CNB
  class Base
    def rate_for(currency, date)
      fail CurrencyMissing unless currency
      fail DateInFuture    if date > Date.today

      rates_for(date)
      rate = @source.at_css("radek[kod='#{currency}']")

      fail CurrencyNotSupported if rate.nil?

      rate.attr('kurz').tr(',', '.').to_f
    end

    private

    def rates_for(date)
      if @source.nil? || (@source && !match_parsed_date?(date))
        @source = source_for(date)
      end

      @source
    end

    def source_for(date)
      Nokogiri::XML(open(url_for(date)))
    end

    def match_parsed_date?(date)
      @source ? Date.parse(@source.at_css('kurzy').attr('datum')) == date : nil
    end

    def normalize_date(date)
      date.is_a?(Date) ? date : Date.parse(date)
    end
  end
end
