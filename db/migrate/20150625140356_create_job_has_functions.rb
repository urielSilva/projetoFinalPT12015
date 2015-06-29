class CreateJobHasFunctions < ActiveRecord::Migration
  def change
    create_table :job_has_functions do |t|
      t.integer :job_id
      t.integer :function_id

      t.timestamps null: false
    end
  end
end
