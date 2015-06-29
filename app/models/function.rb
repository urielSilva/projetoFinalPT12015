class Function < ActiveRecord::Base

	has_many :job_has_functions
	has_many :jobs, through: :job_has_function

end
