require 'open-uri'
require 'nokogiri'

module CNB
  class CurrencyRates
    CUR_RATES_URL = 'http://www.cnb.cz/cs/financni_trhy/devizovy_trh/'

    attr_reader :cur_rates_filepath, :date

    def rate(cur_code)
      get_currency(cur_code)[:rate]
    end

    def name(cur_code)
      get_currency(cur_code)[:name]
    end

    def country(cur_code)
      get_currency(cur_code)[:country]
    end

    protected

    def get_currency(cur_code)
      cur_code.upcase!
      raise 'Currency with given code was not found in exchange rates list' unless @currencies[cur_code]
      @currencies[cur_code]
    end

    def get_currencies
      xml_doc = Nokogiri::XML(open(@cur_rates_url))
      @date = Date.parse(xml_doc.css('kurzy').attr('datum').value)

      xml_doc.css('radek').each do |currency|
        amount = currency.attr('mnozstvi').to_f
        rate = currency.attr('kurz').tr(',', '.').to_f

        @currencies[currency.attr('kod')] = {
          country: currency.attr('zeme'),
          name: currency.attr('mena'),
          rate: rate / amount
        }
      end
    end
  end
end
