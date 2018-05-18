class User < ApplicationRecord
  has_many :tags, through: :tags_users
end
