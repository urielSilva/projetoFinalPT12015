class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name_member
      t.string :email_member
      t.string :password_member

      t.timestamps null: false
    end
  end
end
