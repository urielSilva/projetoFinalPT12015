class AddJobIdToMembers < ActiveRecord::Migration
  def change
    add_column :members, :job_id, :integer
  end

#  add_index :members, :job_id

end
