class Group < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :activities
  default_scope -> { order(name: :asc) }

  validates :name, presence: true, uniqueness: true
end
