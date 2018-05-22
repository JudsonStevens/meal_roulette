require 'rails_helper'

describe 'Admin user' do
  context 'logs in and visits the users index page' do
    it 'can see a list of all users' do
      name = 'Jo'
      username = 'Jo@gmail.com'
      password = 'secret'
      user1 = User.create(name: name, username: username, password: password, admin: true)
      visit(login_path)

      fill_in(:session_email, with: username)
      fill_in(:session_password, with: password)

      click_on('Log In')

      expect(current_path).to eq(user_path(user1))

      visit(admin_users_path)

      expect(page).to have_content(user1.name)
      expect(page).to have_content(user1.username)
    end
  end
end