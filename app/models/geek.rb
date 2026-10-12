class Geek < ApplicationRecord
  has_many :applies, dependent: :destroy

  validates :name,
            presence: true,
            length: { minimum: 2, maximum: 100 }
  validates :stack,
            presence: true,
            length: { minimum: 2, maximum: 200 }

  validates_associated :applies
end