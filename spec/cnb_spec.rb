require 'spec_helper'

describe 'CNB' do
  it 'has a version number' do
    expect(CNB::VERSION).not_to be nil
  end
end
