require 'rails_helper'

describe 'the signin process', type: :feature do
  before :each do
    User.create(username: 'TestUser', password: 'password')
  end

  it 'signs me in' do
    visit '/login'
    within('.session') do
      fill_in 'username', with: 'TestUser'
      fill_in 'password', with: 'password'
    end
    click_button 'Log in'
    expect(page).to have_content 'Welcome'
  end
  it "doesn't sign me in with invalid password" do
    visit '/login'
    within('.session') do
      fill_in 'username', with: 'TestUser'
      fill_in 'password', with: 'wrong-password'
    end
    click_button 'Log in'
    expect(page).to have_content 'Invalid'
  end

  it 'creates a new group' do
    visit '/login'
    within('.session') do
      fill_in 'username', with: 'TestUser'
      fill_in 'password', with: 'password'
    end
    click_button 'Log in'

    visit '/groups/new'
    within('.form-class') do
      fill_in 'Name', with: 'TestGroup'
    end
    click_button 'button'
    expect(page).to have_content 'TestGroup'
  end

  it "doesn't create a new group without a name" do
    visit '/login'
    within('.session') do
      fill_in 'username', with: 'TestUser'
      fill_in 'password', with: 'password'
    end
    click_button 'Log in'

    visit '/groups/new'
    click_button 'button'
    expect(page).to have_content 'Invalid'
  end

  it 'creates a new activity' do
    visit '/login'
    within('.session') do
      fill_in 'username', with: 'TestUser'
      fill_in 'password', with: 'password'
    end
    click_button 'Log in'

    visit '/activities/new'
    within('.new_activity') do
      find('a', text: 'Add a new name').click
      fill_in 'Name', with: 'TestActivity'
      fill_in 'Amount', with: '1.23'
    end
    click_button 'button'
    expect(page).to have_content 'TestActivity'
  end

  it "doesn't create a new activity without an amount" do
    visit '/login'
    within('.session') do
      fill_in 'username', with: 'TestUser'
      fill_in 'password', with: 'password'
    end
    click_button 'Log in'

    visit '/activities/new'
    within('.new_activity') do
      find('a', text: 'Add a new name').click
      fill_in 'Name', with: 'TestActivity'
    end
    click_button 'button'
    expect(page).to have_content 'Invalid'
  end
end
