require 'spec_helper'



describe 'CNB' do

	describe '#for_date' do

		it 'returns hash of all currencies fo given date' do
			date_hash = { 'EUR' => 23.33, 'USD' => 12.33 }
			expect(CNB.for_date(Date.today)).to eql(date_hash)
		end

		it 'returns nil when future date given' do
			expect(CNB.for_date(Date.today + 365)).to eql(nil)
		end
	end

	describe '#rate' do
		it 'returns rate for given currency' do
			rate = 23.33
			expect(CNB.for_date.rate).to eql(rate)
		end
	end

end