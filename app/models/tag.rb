class Tag < ApplicationRecord
  self.inheritance_column = 'inheritance_column'
  
  has_many :restaurant_tags
  has_many :tag_users
  has_many :restaurants, through: :restaurant_tags
  has_many :users, through: :tag_users
  validates_presence_of :type
end
