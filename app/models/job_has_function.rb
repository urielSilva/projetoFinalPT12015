class JobHasFunction < ActiveRecord::Base

	belongs_to :job
	belongs_to :function

end
