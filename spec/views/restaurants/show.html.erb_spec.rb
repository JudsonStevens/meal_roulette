require 'rails_helper'

RSpec.describe "admin/restaurants/show", type: :view do
  before(:each) do
    @restaurant = assign(:restaurant, Restaurant.create!(
      :name => "Name",
      :address => "Address",
      :phone_number => 2,
      :yelp_review_link => "Yelp Review Link"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Yelp Review Link/)
  end
end
