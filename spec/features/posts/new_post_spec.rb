require 'rails_helper'
require 'feature_test_helper'

RSpec.feature 'New post', type: :feature do
  let(:name) { 'Rick' }
  let(:email) { 'rick@c137.com' }
  let(:password) { 'science' }

  scenario 'can visit new post page' do
    sign_up
    log_in

    click_link('New post')

    expect(page).to have_selector("input[type=submit][value='Create']")
  end

  scenario 'can create a new post with image and description' do
    sign_up
    log_in

    picture_location = 'app/assets/images/test.jpg'
    description = 'A picture'

    click_link('New post')

    page.attach_file('post[picture]', Rails.root + picture_location)
    fill_in('post[description]', with: description)
    click_button('Create')

    expect(page).to have_css("img[src*='test.jpg']")
    expect(page).to have_content(description)
  end
end
