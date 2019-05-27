require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'GET #new' do
    it 'returns a success response' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    it 'redirects to posts index after log in' do
      name = 'Rick'
      email = 'rick@c137.com'
      password = 'science'

      User.create!(name: name, email: email, password: password)

      get :new
      post :create, params: {
        session: { email: email, password: password }
      }

      expect(response).to redirect_to(posts_url)
    end

    it 'assigns the matching user_id for email to a session' do
      name = 'Rick'
      email = 'rick@c137.com'
      password = 'science'

      user = User.create!(name: name, email: email, password: password)

      get :new
      post :create, params: {
        session: { email: email, password: password }
      }

      expect(session[:user_id]).to eq user.id
    end
  end
end
