class Group < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :activities
  scope :ordered_by_name, -> { order(name: :asc) }

  validates :name, presence: true, uniqueness: true
end
