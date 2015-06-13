class AddAgendaIdToMeetings < ActiveRecord::Migration
  def change
    add_column :meetings, :agenda_id, :integer
  end

  add_index :meetings, :agenda_id

end
