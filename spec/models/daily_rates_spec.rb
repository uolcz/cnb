require 'spec_helper'

describe CNB::DailyRates do
  before(:each) do
    filepath = File.join('spec', 'fixtures', 'daily_cur_rates.txt')
    CNB::DailyRates.any_instance.stub(:cur_rates_filepath) { filepath }
    @parser = CNB::DailyRates.new
  end

  it 'returns date from the exchange rates file' do
    expect(@parser.date).to eq Date.parse('24.2.2014')
  end

  describe '#cur_rate' do
    it 'returns currency rate' do
      expect(@parser.rate('USD')).to eq(19.927)
    end

    it 'returns currency rate no matter the case of currency code' do
      expect(@parser.rate('usd')).to eq(19.927)
    end

    it 'raises error if currency with given code is not included in the exchange rates file' do
      expect{@parser.rate('USX')}.to raise_error(StandardError)
    end
  end

  it 'returns country name' do
    expect(@parser.name('USD')).to eq('dolar')
  end

  it 'returns currency name' do
    expect(@parser.country('USD')).to eq('USA')
  end
end
