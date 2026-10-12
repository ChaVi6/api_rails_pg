class Company < ApplicationRecord
  has_many :jobs, dependent: :destroy

  validates :name,
            presence: true,
            length: { minimum: 2, maximum: 100 }
  validates :location,
            presence: true,
            length: { minimum: 2, maximum: 100 }

  validates_associated :jobs
  def delete_company
    self.update(deleted: true)
  end
end