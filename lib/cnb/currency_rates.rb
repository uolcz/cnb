require 'open-uri'

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

    def parse
      text = get_page_content(@cur_rates_url)
      lines = text.split("\n")
      @date = parse_date(lines.first)

      lines.shift(2)
      lines.each do |line|
        cur = parse_cur(line)
        @currencies[cur[:cur_code]] = cur[:data]
      end
    end

    def parse_cur(line)
      columns = line.split('|')
      amount = columns[2].to_f
      rate = columns[4].chomp.tr(',', '.').to_f

      data = { country: columns[0], name: columns[1], rate: rate / amount }
      { cur_code: columns[3], data: data }
    end

    def parse_date(line)
      date = line[0..line.index('#') - 1].chomp
      Date.parse(date)
    end

    def get_page_content(url)
      file = open(url)
      file.read
    end
  end
end
