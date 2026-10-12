class Apply < ApplicationRecord
  belongs_to :job
  belongs_to :geek

  validates :job_id,
            presence: true,
            numericality: { only_integer: true, greater_than: 0 }
  validates :geek_id,
            presence: true,
            numericality: { only_integer: true, greater_than: 0 }
  validates :read,
            inclusion: { in: [true, false] }
  validates :invited,
            inclusion: { in: [true, false] }

  validates :geek_id,
            uniqueness: { scope: :job_id,
                          message: "already applied to this job" }
end