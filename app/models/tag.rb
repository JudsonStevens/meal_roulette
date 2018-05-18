class Tag < ApplicationRecord
  has_many :users, through: :tags_users
end
