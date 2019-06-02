require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:name) { 'Rick' }
  let(:email) { 'rick@c137.com' }
  let(:password) { 'science' }
  let(:description) { 'picture-post' }
  let(:picture) { fixture_file_upload('app/assets/images/test.jpg', 'image/jpg') }
  let(:message) { 'A great post!' }

  describe 'POST #create' do
    it 'creates a comment' do
      user = User.create!(name: name, email: email, password: password)
      post = Post.create!(user_id: user.id, description: description, picture: picture)
      session[:user_id] = user.id

      post 'create', params: { comment: { message: message }, post_id: post.id }

      expect(Comment.find_by(message: message)).to be_instance_of(Comment)
    end

    it 'redirects to the post commented on' do
      user = User.create!(name: name, email: email, password: password)
      post = Post.create!(user_id: user.id, description: description, picture: picture)
      session[:user_id] = user.id

      post 'create', params: { comment: { message: message }, post_id: post.id }

      expect(response).to redirect_to(post_url(post))
    end
  end
end
