require 'rails_helper'

RSpec.describe RestaurantTag, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :likeness }
  end

  describe 'Relationships' do
    it { should belong_to :restaurant }
    it { should belong_to :tag }
  end
end
