class Restaurant < ApplicationRecord
  has_many :restaurant_tags
  has_many :tags, through: :restaurant_tags
  validates_presence_of :name, :address, :phone_number
end
