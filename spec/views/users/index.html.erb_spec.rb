require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :name => "John",
        :username => "John@gmail.com",
        :password_digest => "CrazyLongPassword"
        ),
      User.create!(
        :name => "Jim",
        :username => "Jim@gmail.com",
        :password_digest => "CrazyLongPassword"
        )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "#{User.all.first.name}"
    assert_select "tr>td", :text => "#{User.all.first.username}"
    assert_select "tr>td", :text => "#{User.all.last.name}"
    assert_select "tr>td", :text => "#{User.all.last.username}"
  end
end
