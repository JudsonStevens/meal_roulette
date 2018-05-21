require 'rails_helper'

describe 'User' do
  it 'can create an account with a user name and password and be redirected to the profile page' do
    name = 'John Smith'
    email = 'John@gmail.com'
    password = 'LongPassword'
    profile_page_message = 'Fill out your likes, dislikes, and dietary restrictions!'
    visit(new_user_path)

    fill_in('user[name]', with: name)
    fill_in('user[username]', with: email)
    fill_in('user[password_digest]', with: password)
    fill_in('user[password_confirmation]', with: password)

    click_on('Create User')

    expect(current_path).to eq(user_path(User.all.first))
    expect(page).to have_content(User.all.first.username)
    expect(page).to have_content(User.all.first.name)
    expect(page).to have_content(profile_page_message)
  end
end
