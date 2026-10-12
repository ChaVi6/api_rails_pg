class Job < ApplicationRecord
  belongs_to :company
  has_many :applies, dependent: :destroy

  PLACES = ['Remote', 'Contract', 'Permanent', 'Office', 'Hybrid'].freeze

  validates :name,
            presence: true,
            length: { minimum: 3, maximum: 150 }
  validates :place,
            presence: true,
            inclusion: { in: PLACES,
                         message: "%{value} is not a valid place. Allowed: #{PLACES.join(', ')}" }
  validates :company_id,
            presence: true,
            numericality: { only_integer: true, greater_than: 0 }

  validates_associated :applies
end