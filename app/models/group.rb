class Group < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :activities

  validates :name, presence: true, uniqueness: true
end
