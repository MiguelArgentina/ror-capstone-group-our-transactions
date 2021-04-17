class User < ApplicationRecord
  has_secure_password
  has_many :groups, class_name: 'Group', foreign_key: 'creator_id'
  has_many :activities, class_name: 'Activity', foreign_key: 'author_id'
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
end
