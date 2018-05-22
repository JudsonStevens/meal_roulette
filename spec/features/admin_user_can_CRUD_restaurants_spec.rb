require 'rails_helper'

describe 'Admin user' do
  before(:each) do
    name = 'John Smith'
    username = 'john@gmail.com'
    password = 'LongPassword'
    @restaurant1 = Restaurant.create(name: 'Billys BBQ', address: '225 Westwood Ave', phone_number: 2253432222)
    @admin = User.create(name: name, username: username, password: password, admin: true)
  end

  context 'logs in and goes to restaurant index' do
    it 'can see a list of all restaurants' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)

      visit(admin_restaurants_path)

      expect(page).to have_content(@restaurant1.name)
      expect(page).to have_content(@restaurant1.address)
      expect(page).to have_content(@restaurant1.phone_number)
    end
  end
end
