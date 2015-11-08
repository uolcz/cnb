require 'spec_helper'
require 'webmock/rspec'

RSpec.describe CNB::Application do
  let(:rates) { CNB::ExchangeRates.new }
  let(:currency) { 'AUD' }
  let(:monthly_currency) { 'ALL' }
  let(:date) { Date.parse('25.02.2014') }

  describe '#rate_for' do
    before do
      url = CNB::RATES_URL + date.strftime('%d.%m.%Y')
      stub_request(:get, url)
        .to_return(status: 200, body: load_fixture)

      monthly_url = CNB::MONTHLY_URL + date.strftime('%m') + CNB::MONTHLY_SEP + date.strftime('%Y')
      stub_request(:get, monthly_url)
        .to_return(status: 200, body: load_monthly_fixture)
    end

    context 'monthly == false' do
      it 'returns rate for given currency and date' do
        expect(rates.rate_for(currency, date, false)).to eql(17.936)
      end
    end

    context 'monthly == true' do
      it 'returns rate for given currency and date' do
        expect(rates.rate_for(monthly_currency, date, true)).to eql(19.564)
      end
    end

    it 'raises CurrencyNotSupported exception when invalid currency given' do
      expect { rates.rate_for('FOOBAR', date, false) }
        .to raise_error CNB::CurrencyNotSupported
    end
  end

  def load_fixture
    File.open('spec/fixtures/daily_rates.xml')
  end

  def load_monthly_fixture
    File.open('spec/fixtures/monthly_rates.xml')
  end
end
