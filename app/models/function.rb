class Function < ActiveRecord::Base

	has_many :jobs, through: :job_has_function


end
