require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:name) { 'Rick' }
  let(:email) { 'rick@c137.com' }
  let(:password) { 'science' }
  let(:user) { User.create!(name: name, email: email, password: password) }

  let(:description) { 'picture-post' }
  let(:picture) { fixture_file_upload('app/assets/images/test.jpg', 'image/jpg') }
  let(:post) { Post.create!(user_id: user.id, description: description, picture: picture) }

  let(:message) { 'Great post!' }
  let(:subject) { described_class.new(message: message, post_id: post.id, user_id: user.id) }

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a message' do
      subject.message = nil
      expect(subject).to_not be_valid
    end
  end

  describe 'Associations' do
    it 'is a comment on a post' do
      association = described_class.reflect_on_association(:post)
      expect(association.macro).to eq :belongs_to
    end

    it 'is made by a user' do
      association = described_class.reflect_on_association(:user)
      expect(association.macro).to eq :belongs_to
    end
  end
end
