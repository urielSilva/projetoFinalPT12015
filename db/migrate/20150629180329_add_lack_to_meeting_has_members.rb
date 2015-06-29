class AddLackToMeetingHasMembers < ActiveRecord::Migration
  def change
    add_column :meeting_has_members, :meeting_mandatory, :integer
    add_column :meeting_has_members, :meeting_presence, :integer
  end
end
