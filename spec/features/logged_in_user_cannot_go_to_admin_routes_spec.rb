require 'rails_helper'

describe 'User' do
  context 'logged in without admin priveledges and tries to access /admin/users' do
    it 'cannot see the page' do
      name = 'John'
      username = 'John@gmail.com'
      password = 'secret11'
      user1 = User.create(name: name, username: username, password: password)
      visit(root_path)
      click_on("Login")

      fill_in(:session_email, with: username)
      fill_in(:session_password, with: password)

      click_on('Log In')

      expect(current_path).to eq(user_path(user1))

      visit(admin_users_path)

      expect(page).to have_content('You are not authorized to view this page')
    end
  end
end