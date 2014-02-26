require 'spec_helper'

describe CNB::MonthlyRates do
  before(:each) do
    filepath = File.join('spec', 'fixtures', 'monthly_rates_2013_03.xml')
    xml_doc = Nokogiri::XML(File.read(filepath))
    Nokogiri::XML::Document.should_receive(:parse).and_return { xml_doc }
    @parser = CNB::MonthlyRates.new(3, 2013)
  end

  it 'raises error if required month is invalid' do
    expect{CNB::MonthlyRates.new('abc', 2013)}.to raise_error(StandardError)
    expect{CNB::MonthlyRates.new(0, 2013)}.to raise_error(StandardError)
    expect{CNB::MonthlyRates.new(13, 2013)}.to raise_error(StandardError)
  end

  it 'raises error if required year is invalid' do
    expect{CNB::MonthlyRates.new(3, 'abc')}.to raise_error(StandardError)
    expect{CNB::MonthlyRates.new(3, 2000)}.to raise_error(StandardError)
    expect{CNB::MonthlyRates.new(3, 2050)}.to raise_error(StandardError)
  end

  it 'returns date from the exchange rates file' do
    expect(@parser.date).to eq Date.parse('29.3.2013')
  end

  describe '#cur_rate' do
    it 'returns currency rate' do
      expect(@parser.rate('HNL')).to eq(1.024)
    end

    it 'returns currency rate no matter the case of the currency code' do
      expect(@parser.rate('hnl')).to eq(1.024)
    end

    it 'raises error if currency wth given code is not included in the exchange rates file' do
      expect{@parser.rate('HNX')}.to raise_error(StandardError)
    end
  end

  it 'returns country name' do
    expect(@parser.country('HNL')).to eq('Honduras')
  end

  it 'returns currency name' do
    expect(@parser.name('HNL')).to eq('lempira')
  end
end
