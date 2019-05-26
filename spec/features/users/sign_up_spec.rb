require 'rails_helper'

RSpec.feature 'Sign-up', type: :feature do
  scenario 'can visit sign-up page' do
    visit '/users/new'
    expect(page).to have_content('Sign up with your email address')
  end
end
