require 'rails_helper'

describe 'Admin user' do
  context 'logs in and visits restaurants index' do
    it 'can see all restaurants' do
      name = 'Jo'
      username = 'Jo@gmail.com'
      password = 'secret'
      user1 = User.create(name: name, username: username, password: password, admin: true)
      restaurant1 = Restaurant.create(name: 'Billys BBQ', address: '225 Westwood Ave', phone_number: '2253432222')
      visit(login_path)

      fill_in(:session_email, with: username)
      fill_in(:session_password, with: password)

      click_on('Log In')

      expect(current_path).to eq(user_path(user1))

      visit(admin_restaurants_path)

      expect(page).to have_content(restaurant1.name)
      expect(page).to have_content(restaurant1.address)
      expect(page).to have_content(restaurant1.phone_number)
    end
  end
end