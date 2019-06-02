require 'rails_helper'

RSpec.feature 'Add comments', type: :feature do
  let(:name) { 'Rick' }
  let(:email) { 'rick@c137.com' }
  let(:password) { 'science' }
  let(:description) { 'picture-post' }
  let(:picture) { 'app/assets/images/test.jpg' }

  scenario 'can add comments to a post' do
    sign_up
    log_in
    new_post

    find(:xpath, "//a/img[@alt='test.jpg']/..").click

    message = 'A great post!'
    fill_in('comment[message]', with: message)
    click_button('Add')

    expect(page).to have_content(message)

    another_message = 'I can add more comments'
    fill_in('comment[message]', with: another_message)
    click_button('Add')

    expect(page).to have_content(message)
    expect(page).to have_content(another_message)
  end
end
