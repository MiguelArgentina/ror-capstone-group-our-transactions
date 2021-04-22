class Activity < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :group, optional: true
  scope :ordered_by_date, -> { order(created_at: :asc) }

  validates :name, presence: true
  validates :amount, presence: true, numericality: true
end
