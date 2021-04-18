require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is not valid without a username' do
    user = User.new(username: nil, password: '123456')
    expect(user).to_not be_valid
  end
  it 'should have a unique username' do
    User.create!(username: 'TestUser', password: '123456')
    test_user = User.new(username: 'TestUser')
    expect(test_user).to_not be_valid
    expect(test_user.errors[:username]).to include('has already been taken')
  end
end

