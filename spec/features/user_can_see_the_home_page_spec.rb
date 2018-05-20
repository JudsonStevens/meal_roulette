require 'rails_helper'

describe 'User' do
  describe 'sees the homepage' do
    it 'and it renders the correct homepage with the nav bar and app name' do
      app_name = 'Meal Roulette'
      app_description = 'Meal Roulette is a service that speeds up the decision making process on where to eat!'
      nav_bar = 'Home'
      nav_bar_2 = 'Profile'
      nav_bar_3 = 'Spin the Wheel'

      visit(root_path)

      expect(page).to have_content(app_name)
      expect(page).to have_content(app_description)
      within('nav') do
        expect(page).to have_content(nav_bar)
      end
    end

    it 'and it provides the links to the profile page and to spin the wheel' do

    end
  end
end
