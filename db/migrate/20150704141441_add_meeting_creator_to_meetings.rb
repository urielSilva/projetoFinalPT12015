class AddMeetingCreatorToMeetings < ActiveRecord::Migration
  def change
    add_column :meetings, :meeting_creator, :integer
  end
end
