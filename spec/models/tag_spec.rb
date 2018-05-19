require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :type }
  end

  describe 'Relationships' do
    it { should have_many(:restaurants).through(:restaurant_tags) }
    it { should have_many :users }
    it { should have_many :tag_users }
    it { should have_many :restaurant_tags }
  end
end
