class User < ApplicationRecord
  before_save { self.username = username.downcase}
  has_many :tag_users
  has_many :tags, through: :tag_users
  validates_presence_of :name
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
  has_secure_password
  validates_confirmation_of :password
end
