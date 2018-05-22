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

    it 'can create a new restaurant after clicking create new restaurant' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
      name = 'Bobbys Fire'
      address = 'Newcastle'
      phone_number = 3342323333
      yelp_review_link = 'yelp.com'
      visit(admin_restaurants_path)

      click_on('New Restaurant')

      fill_in(:restaurant_name, with: name)
      fill_in(:restaurant_address, with: address)
      fill_in(:restaurant_phone_number, with: phone_number)
      fill_in(:restaurant_yelp_review_link, with: yelp_review_link)

      click_on('Create Restaurant')

      expect(page).to have_content(name)
      expect(page).to have_content(address)
      expect(page).to have_content(phone_number)
      expect(page).to have_content(yelp_review_link)
    end
      
  end
end
