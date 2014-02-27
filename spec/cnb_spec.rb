require 'spec_helper'

describe 'CNB' do
  describe '#daily_rates' do
    before(:each) do
      CNB::DailyRates.any_instance.stub(:get_currencies) { {} }
    end

    it 'returns DailyRates object' do
      expect(CNB.daily_rates).to be_a(CNB::DailyRates)
    end

    it 'always returns the same object' do
      rates = CNB.daily_rates
      expect(CNB.daily_rates).to eq rates
    end
  end

  describe '#monthly_rates' do
    before(:each) do
      CNB::MonthlyRates.any_instance.stub(:get_currencies) { {} }
    end

    it 'returns MonthlyRates object' do
      expect(CNB.monthly_rates(11,2013)).to be_a(CNB::MonthlyRates)
    end

    it 'always returns the same object for the same combination of month and year params' do
      rates = CNB.monthly_rates(11, 2013)
      expect(CNB.monthly_rates(11, 2013)).to eq rates
      expect(CNB.monthly_rates(10, 2013)).not_to eq rates
    end
  end
end
