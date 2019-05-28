require 'rails_helper'

RSpec.feature 'New post', type: :feature do
  scenario 'can visit new post page' do
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

    expect(page).to have_content(name)

    click_link('New post')
    expect(page).to have_selector("input[type=submit][value='Create']")
  end

  scenario 'can create a new post with image and description' do
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

    expect(page).to have_css("img[src*='test.jpg']")
    expect(page).to have_content(description)
  end
end
