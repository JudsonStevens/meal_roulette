require 'rails_helper'

describe 'User' do
  describe 'at the login page' do
    it 'displays a flash message on an incorrect login' do
      email = 'Josh@gmail.com'
      password = 'NewPassword'
      invalid = 'Invalid email/password combination'
      visit(login_path)

      fill_in('session[email]', with: email)
      fill_in('session[password]', with: password)

      click_on('Log In')

      expect(page).to have_content(invalid)
    end
  end
end
