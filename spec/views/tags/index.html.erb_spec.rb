require 'rails_helper'

RSpec.describe "tags/index", type: :view do
  before(:each) do
    assign(:tags, [
      Tag.create!(
        :type => "Type"
      ),
      Tag.create!(
        :type => "Type"
      )
    ])
  end

  it "renders a list of tags" do
    render
    assert_select "tr>td", :text => "Type".to_s, :count => 2
  end
end
