require 'rails_helper'

RSpec.feature 'View single post', type: :feature do
  scenario 'can view a post when clicking picture on index' do
    name = 'Rick'
    email = 'rick@c137.com'
    password = 'science'

    visit '/users/new'

    fill_in('user[name]', with: name)
    fill_in('user[email]', with: email)
    fill_in('user[password]', with: password)
    click_button('Sign up')

    fill_in('session[email]', with: email)
    fill_in('session[password]', with: password)
    click_button('Log in')

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
