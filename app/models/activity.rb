class Activity < ApplicationRecord
  belongs_to :author, class_name: 'User'

  validates :name, presence: true
  validates :amount, presence: true, numericality: true
end
