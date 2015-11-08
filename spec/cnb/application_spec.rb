require 'spec_helper'

RSpec.describe CNB::Application do
  let(:app) { CNB::Application.new }
  let(:currency) { 'AUD' }
  let(:dates) do
    {
      today: Date.today,
      valid_past: Date.today - (365 * 14),
      invalid_past: Date.today - (365 * 25),
      monthly_valid_past: Date.today - (365 * 8),
      monthly_invalid_past: Date.today - (365 * 11)
    }
  end

  describe '#initialize' do
    it 'creates ExchangeRates object' do
      expect(app.rates).to be_kind_of(CNB::ExchangeRates)
    end
  end

  describe '#exchange_rate' do
    context 'monthly == false' do
      it 'calls rate_for with valid date and returns rate' do
        expect(app.rates).to receive(:rate_for)
          .with(currency, dates[:valid_past], false)
        app.exchange_rate(currency, dates[:valid_past])
      end

      it 'calls rate_for with default date if missing' do
        expect(app.rates).to receive(:rate_for)
          .with(currency, dates[:today], false)
        app.exchange_rate(currency)
      end

      it 'raises DateTooOld exception with too old date' do
        expect { app.exchange_rate(currency, dates[:invalid_past]) }
          .to raise_error CNB::DateTooOld
      end
    end

    context 'monthly == true' do
      it 'calls rate_for with valid date and returns rate' do
        expect(app.rates).to receive(:rate_for)
          .with(currency, dates[:monthly_valid_past], true)
        app.exchange_rate(currency, dates[:monthly_valid_past], true)
      end

      it 'raises DateTooOld exception with too old date' do
        expect { app.exchange_rate(currency, dates[:monthly_invalid_past], true) }
          .to raise_error CNB::DateTooOld
      end
    end

    it 'raises CurrencyMissing exception without currency' do
      expect { app.exchange_rate(nil) }.to raise_error CNB::CurrencyMissing
    end
  end
end
