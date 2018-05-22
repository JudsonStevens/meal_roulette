require 'rails_helper'

RSpec.describe "users/new", type: :view do
  before(:each) do
    assign(:user, User.new(
      :name => "John",
      :username => "John@gmail.com",
      :password => "CrazyLongPassword"
    ))
  end

  it "renders new user form" do
    render
    assert_select "form[action=?][method=?]", users_path, "post" do

      assert_select "input[name=?]", "user[name]"

      assert_select "input[email=?]", "user[:username]"

      assert_select "input[password=?]", "user[:password]"
    end
  end
end
