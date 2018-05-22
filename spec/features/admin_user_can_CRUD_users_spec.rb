require 'rails_helper'

describe 'Admin user' do
  before(:each) do
    name = 'Jo'
    username = 'Jo@gmail.com'
    password = 'secret'
    @user1 = User.create(name: 'John', username: 'John@gmail.com', password: 'newthing')
    @user2 = User.create(name: name, username: username, password: password, admin: true)
    visit(login_path)

    fill_in(:session_email, with: username)
    fill_in(:session_password, with: password)

    click_on('Log In')
  end

  context 'logs in and goes to index page' do
    xit 'can create a new user after clicking on the create user link' do
      expect(current_path).to eq(user_path(@user1))

      visit(admin_users_path)
      click_on('New User')

      name = 'John Smith'
      email = 'john@gmail.com'
      password = 'LongPassword'

      visit(new_admin_user_path)

      fill_in('user[name]', with: name)
      fill_in('user[username]', with: email)
      fill_in('user[password]', with: password)
      fill_in('user[password_confirmation]', with: password)

      click_on('Create User')

      expect(current_path).to eq(admin_users_path)
      expect(page).to have_content(name)
      expect(page).to have_content(email)
      expect(page).to have_content('All Users')
    end

    it 'can edit a user after clicking on edit next to the users name' do
      expect(current_path).to eq(user_path(@user2))

      visit(admin_users_path)

      expect(page).to have_content(@user1.name)

      click_on('Edit', :match => :first)

      expect(current_path).to eq(edit_admin_user_path(@user1))

      fill_in('user[name]', with: 'Jonathan')

      click_on('Update User')

      expect(current_path).to eq(admin_users_path)
    end

    it 'can delete a user after clicking on the delete button next to the users name' do
      expect(current_path).to eq(user_path(@user2))

      visit(admin_users_path)

      expect(page).to have_content(@user1.name)
      expect(page).to have_content(@user2.name)
      click_on('Destroy', :match => :first)

      expect(page).to have_content(@user2.name)
      expect(page).to_not have_content(@user1.name)

    end
  end
end
