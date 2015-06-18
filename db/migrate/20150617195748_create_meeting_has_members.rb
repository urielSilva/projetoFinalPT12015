class CreateMeetingHasMembers < ActiveRecord::Migration
  def change
    create_table :meeting_has_members do |t|
      t.integer :meeting_id
      t.integer :member_id

      t.timestamps null: false
    end
  end
end
