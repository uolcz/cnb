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

    def parse(filepath)
      @date = parse_date(filepath)
      cur_rates = File.read(filepath)
      lines = cur_rates.lines.to_a

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

    def parse_date(filepath)
      line = File.open(filepath) { |f| f.readline }
      date = line[0..line.index('#') - 1].chomp
      Date.parse(date)
    end

    def download_cur_rates(url)
      content = get_page_content(url)
      f = File.new(@cur_rates_filepath, 'w')
      f.write(content)
      f.close
    end

    def get_page_content(url)
      file = open(url)
      file.read
    end
  end
end
