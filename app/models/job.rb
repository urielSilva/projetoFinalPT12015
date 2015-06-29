class Job < ActiveRecord::Base

 	validates :job_name, presence: true, length: { maximum: 100 }

	has_many :job_has_functions
 	has_many :functions, through: :job_has_function
	belongs_to :member

end
