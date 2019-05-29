require 'rails_helper'

RSpec.feature 'All posts', type: :feature do
  scenario 'can see all posts created' do
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

    picture_location_one = 'app/assets/images/test.jpg'
    description_one = 'A picture'

    click_link('New post')
    page.attach_file('post[picture]', Rails.root + picture_location_one)
    fill_in('post[description]', with: description_one)
    click_button('Create')

    picture_location_two = 'app/assets/images/test2.jpg'
    description_two = 'Another picture'

    click_link('New post')
    page.attach_file('post[picture]', Rails.root + picture_location_two)
    fill_in('post[description]', with: description_two)
    click_button('Create')

    expect(page).to have_css("img[src*='test.jpg']")
    expect(page).to have_content(description_one)
    expect(page).to have_css("img[src*='test2.jpg']")
    expect(page).to have_content(description_two)
  end
end
