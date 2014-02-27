require 'spec_helper'

describe 'CNB' do
  describe '#daily_rates' do
    before(:each) do
      CNB::DailyRates.any_instance.stub(:get_currencies) { {} }
    end

    it 'returns DailyRates object' do
      expect(CNB.daily_rates).to be_a(CNB::DailyRates)
    end
  end

  describe '#monthly_rates' do
    before(:each) do
      CNB::MonthlyRates.any_instance.stub(:get_currencies) { {} }
    end

    it 'returns MonthlyRates object' do
      expect(CNB.monthly_rates(11,2013)).to be_a(CNB::MonthlyRates)
    end
  end
end
