require 'rails_helper'

describe UsersController, type: :controller do
  describe 'GET #new' do
    it 'returns a success response' do
      get :new
      expect(response).to have_http_status(:success)
    end

    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    it 'creates a new user' do
      name = 'Rick'
      email = 'rick@c137.com'
      password = 'science'

      get :new
      post :create, params: {
        user: {
          name: name, email: email, password: password
        }
      }
      user = User.find_by(email: email)
      expect(user.name).to eq name
    end

    it 'redirects to new session url' do
      name = 'Rick'
      email = 'rick@c137.com'
      password = 'science'

      get :new
      post :create, params: {
        user: {
          name: name, email: email, password: password
        }
      }
      expect(response).to redirect_to(new_session_url)
    end
  end
end
