class Job < ActiveRecord::Base

  validates :job_name, presence: true, length: { maximum: 100 }

  belongs_to :member

end
