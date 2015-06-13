class CreateFunctions < ActiveRecord::Migration
  def change
    create_table :functions do |t|
      t.string :function_name
      t.string :function_module
      t.string :function_url

      t.timestamps null: false
    end
  end
end
