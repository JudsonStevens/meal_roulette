class User < ApplicationRecord
  has_many :tag_users
  has_many :tags, through: :tag_users
  validates_presence_of :name, :username
  validates_confirmation_of :password_digest
end
