require 'rails_helper'

RSpec.describe Activity, type: :model do
  it 'is not valid without a name' do
    activity = Activity.new(name: nil, amount: '1.23', author_id: 1)
    expect(activity).to_not be_valid
  end

  it 'is not valid without an amount' do
    activity = Activity.new(name: 'Test Activity', amount: nil, author_id: 1)
    expect(activity).to_not be_valid
  end

  it 'is not valid with not numeric amount values' do
    activity = Activity.new(name: 'Test Activity', amount: 'abc', author_id: 1)
    expect(activity).to_not be_valid
  end
end
