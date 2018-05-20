require 'rails_helper'

RSpec.describe "sessions/new.html.slim", type: :view do
  describe 'User should see the log in page' do
    it 'with a form for email and password' do
      form_name = 'Log In'
      form_field_1 = 'Email'
      form_field_2 = 'Password'
      after_form = 'New User?'
      render

      expect(rendered).to have_content(form_name)
      expect(rendered).to have_content(form_field_1)
      expect(rendered).to have_content(form_field_2)
      expect(rendered).to have_content(after_form)
    end
  end
end
