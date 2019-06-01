require 'rails_helper'

RSpec.feature 'View single post', type: :feature do
  let(:name) { 'Rick' }
  let(:email) { 'rick@c137.com' }
  let(:password) { 'science' }

  scenario 'can view a post when clicking picture on index' do
    sign_up
    log_in

    picture_location = 'app/assets/images/test.jpg'
    description = 'A picture'

    click_link('New post')
    page.attach_file('post[picture]', Rails.root + picture_location)
    fill_in('post[description]', with: description)
    click_button('Create')

    find(:xpath, "//a/img[@alt='test.jpg']/..").click
    expect(page).to have_css("img[src*='test.jpg']")
    expect(page).to have_content(description)
  end
end
