require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:name) { 'Rick' }
  let(:email) { 'rick@c137.com' }
  let(:password) { 'science' }
  let(:description) { 'picture-post' }
  let(:picture) {
    fixture_file_upload('app/assets/images/test.jpg', 'image/jpg')
  }

  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

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
    it 'creates a post' do
      user = User.create!(name: name, email: email, password: password)
      session[:user_id] = user.id

      get :new
      post :create, params: {
        post: {
          description: description,
          picture: picture
        }
      }

      expect(Post.find_by(description: 'picture-post')).to be_instance_of(Post)
    end

    it 'redirects to the posts page' do
      user = User.create!(name: name, email: email, password: password)
      session[:user_id] = user.id

      get :new
      post :create, params: {
        post: {
          description: description,
          picture: picture
        }
      }

      expect(response).to redirect_to(posts_url)
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      user = User.create!(name: name, email: email, password: password)
      session[:user_id] = user.id

      post = Post.create!(user_id: user.id, description: description, picture: picture)
      get :show, params: { id: post.id }

      expect(response).to have_http_status(:success)
    end

    it 'renders the show template' do
      user = User.create!(name: name, email: email, password: password)
      session[:user_id] = user.id

      post = Post.create!(user_id: user.id, description: description, picture: picture)
      get :show, params: { id: post.id }

      expect(response).to render_template(:show)
    end
  end
end
