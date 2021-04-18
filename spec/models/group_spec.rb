require 'rails_helper'

RSpec.describe Group, type: :model do
  it 'is not valid without a name' do
    group = Group.new(name: nil)
    expect(group).to_not be_valid
  end
  it 'should have a unique name' do
    user = User.create!(username: 'TestUser', password: '123456', id: 1)
    user.groups.create!(name: 'TestGroup', creator_id: 1)
    test_group = Group.new(name: 'TestGroup')
    expect(test_group).to_not be_valid
    expect(test_group.errors[:name]).to include('has already been taken')
  end
end

