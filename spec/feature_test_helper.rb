def sign_up
  visit '/users/new'
  fill_in('user[name]', with: name)
  fill_in('user[email]', with: email)
  fill_in('user[password]', with: password)
  click_button('Sign up')
end

def log_in
  visit '/sessions/new'
  fill_in('session[email]', with: email)
  fill_in('session[password]', with: password)
  click_button('Log in')
end

def new_post
  visit '/posts/new'
  page.attach_file('post[picture]', Rails.root + picture)
  fill_in('post[description]', with: description)
  click_button('Create')
end
