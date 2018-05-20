require 'rails_helper'

RSpec.describe "Restaurants", type: :request do
  describe "GET /restaurants" do
    it "works! (now write some real specs)" do
      get admin_restaurants_path
      expect(response).to have_http_status(200)
    end
  end
end
