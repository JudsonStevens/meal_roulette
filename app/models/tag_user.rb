class TagUser < ApplicationRecord
  belongs_to :user
  belongs_to :tag

  validates_presence_of :preference
end