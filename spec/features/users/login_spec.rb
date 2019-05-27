require 'rails_helper'

RSpec.feature 'Log in', type: :feature do
  scenario 'can visit log in page' do
    visit 'sessions/new'
    expect(page).to have_selector("input[type=submit][value='Log in']")
  end

  scenario 'fill-in form and submit to log in' do
    name = 'RickSanchez'
    email = 'rick@c137.com'
    password = 'science'
    user = User.create!(name: name, email: email, password: password)

    visit '/sessions/new'

    fill_in('session[email]', with: email)
    fill_in('session[password]', with: password)
    click_button('Log in')

    expect(page).to have_content(name)
  end
end
