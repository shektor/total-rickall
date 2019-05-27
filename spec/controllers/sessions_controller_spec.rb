require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'GET #new' do
    it 'returns a success response' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    it 'redirects if email exists and password match' do
      name = 'Rick'
      email = 'rick@c137.com'
      password = 'science'

      user = User.create!(name: name, email: email, password: password)

      get :new
      post :create, params: {
        session: { email: email, password: password }
      }

      expect(response).to redirect_to(posts_url)
    end
  end
end
