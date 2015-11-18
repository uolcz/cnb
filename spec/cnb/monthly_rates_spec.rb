require 'spec_helper'
require 'webmock/rspec'
require 'timecop'

RSpec.describe CNB::MonthlyRates do
  let(:monthly_rates) { CNB::MonthlyRates.new }
  let(:currency) { 'ALL' }
  let(:dates) do
    {
      invalid_past: Date.today - (365 * 11),
      future: Date.today + 100
    }
  end

  describe '#rate_for' do
    before do
      Timecop.freeze('25.02.2014')
      url = CNB::BASE_URL + CNB::MONTHLY + Date.today.strftime('%m') +
            CNB::MONTHLY_SEP + Date.today.strftime('%Y')
      stub_request(:get, url)
        .to_return(status: 200, body: load_fixture)
    end

    after do
      Timecop.return
    end

    context 'valid parameters' do
      it 'returns rate for given currency and date' do
        expect(monthly_rates.rate_for(currency, Date.today)).to eql(19.564)
      end

      it 'returns rate for given currency with default date' do
        expect(monthly_rates.rate_for(currency)).to eql(19.564)
      end
    end

    context 'invalid parameters' do
      it 'raises CurrencyNotSupported exception when invalid currency given' do
        expect { monthly_rates.rate_for('FOOBAR') }
          .to raise_error CNB::CurrencyNotSupported
      end

      it 'raises DateTooOld exception with too old date' do
        expect { monthly_rates.rate_for(currency, dates[:invalid_past]) }
          .to raise_error CNB::DateTooOld
      end

      it 'raises DateInFuture exception with future date' do
        expect { monthly_rates.rate_for(currency, dates[:future]) }
          .to raise_error CNB::DateInFuture
      end

      it 'raises CurrencyMissing exception when no currency given' do
        expect { monthly_rates.rate_for(nil) }
          .to raise_error CNB::CurrencyMissing
      end
    end
  end

  def load_fixture
    File.open('spec/fixtures/monthly_rates.xml')
  end
end
