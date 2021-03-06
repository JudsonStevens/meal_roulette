require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :address }
    it { should validate_presence_of :phone_number }
  end

  describe 'relationships' do
  end
end