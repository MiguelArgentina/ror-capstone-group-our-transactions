class Group < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :activities
end
