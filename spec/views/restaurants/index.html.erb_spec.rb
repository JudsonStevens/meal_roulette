require 'rails_helper'

RSpec.describe "restaurants/index", type: :view do
  before(:each) do
    assign(:restaurants, [
      Restaurant.create!(
        :name => "Name",
        :address => "Address",
        :phone_number => 2,
        :yelp_review_link => "Yelp Review Link"
      ),
      Restaurant.create!(
        :name => "Name",
        :address => "Address",
        :phone_number => 2,
        :yelp_review_link => "Yelp Review Link"
      )
    ])
  end

  it "renders a list of restaurants" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Yelp Review Link".to_s, :count => 2
  end
end
