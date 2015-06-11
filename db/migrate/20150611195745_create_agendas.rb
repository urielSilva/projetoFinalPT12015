class CreateAgendas < ActiveRecord::Migration
  def change
    create_table :agendas do |t|
      t.string :agenda_name
      t.string :agenda_description
      t.date :agenda_date

      t.timestamps null: false
    end
  end
end
