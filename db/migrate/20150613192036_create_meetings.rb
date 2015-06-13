class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.string :meeting_name
      t.string :meeting_description
      t.date :meeting_date

      t.timestamps null: false
    end
  end
end
