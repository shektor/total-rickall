require 'rails_helper'

RSpec.feature 'Sign-up', type: :feature do
  scenario 'can visit sign-up page' do
    visit '/users/new'
    expect(page).to have_content('Sign up with your email address')
  end

  scenario 'fill-in form and submit' do
    name = 'Rick'
    email = 'rick@c137.com'
    password = 'science'

    visit '/users/new'

    fill_in('user[name]', with: name)
    fill_in('user[email]', with: email)
    fill_in('user[password]', with: password)
    click_button('Sign up')

    expect(page).to have_selector("input[type=submit][value='Log in']")
  end
end
