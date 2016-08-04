require 'spec_helper'

RSpec.describe CNB do
  it 'has a version number' do
    expect(CNB::VERSION).not_to be nil
  end

  it 'has .daily_rate module method' do
    spy = double( "CNB::DailyRates" )
    allow( CNB::DailyRates ).to receive( :new ).and_return( spy )
    expect( spy ).to receive( :rate_for ).with( :currency, :date )
    CNB.daily_rate :currency, :date
    expect( spy ).to receive( :rate_for ).with( :currency, Date.today )
    CNB.daily_rate :currency
  end

  it 'has .monthly_rate module method' do
    spy = double( "CNB::MonthlyRates" )
    allow( CNB::MonthlyRates ).to receive( :new ).and_return( spy )
    expect( spy ).to receive( :rate_for ).with( :currency, :date )
    CNB.monthly_rate :currency, :date
    expect( spy ).to receive( :rate_for ).with( :currency, Date.today )
    CNB.monthly_rate :currency
  end
end
