require 'rails_helper'

RSpec.describe "users/edit", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :name => "John",
      :username => "John@gmail.com",
      :password_digest => "CrazyLongPassword"
      ))
  end

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(@user), "post" do
      
      assert_select "input[name=?]", "user[name]"

      assert_select "input[name=?]", "user[username]"
    end
  end
end
