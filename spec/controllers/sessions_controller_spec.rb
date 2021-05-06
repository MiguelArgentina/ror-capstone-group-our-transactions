# spec/controllers/sessions_controller_spec.rb
require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  context 'when password is invalid' do
    it "renders the login page with 'Invalid signup details message'" do
      user = User.create(id: 1, username: 'Miguel', password: '123456')
      post :create, session: { username: user.username, password: 'invalid' }
      expect(response).to render_template('sessions/login')
      expect(flash[:danger]).to match(/^Invalid signup details/)
    end
  end

  context 'when password is valid' do
    it 'get a 200 html message (OK)' do
      user = User.create(id: 1, username: 'Miguel', password: '123456')
      get :create, session: { username: user.username, password: user.password }
      expect(response).to be_ok
    end
  end
end
