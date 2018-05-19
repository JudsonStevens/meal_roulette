require 'rails_helper'

RSpec.describe TagUser, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :preference }
  end

  describe 'Relationships' do
    it { should belong_to :user }
    it { should belong_to :tag }
  end
end