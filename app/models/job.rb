class Job < ActiveRecord::Base

 	validates :job_name, presence: true, length: { maximum: 100 }

 	has_many :functions, through: :job_has_function

end
