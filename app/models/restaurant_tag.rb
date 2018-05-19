class RestaurantTag < ApplicationRecord
  belongs_to :restaurant
  belongs_to :tag

  validates_presence_of :likeness
end
