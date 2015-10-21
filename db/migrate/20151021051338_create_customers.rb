class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :full_name
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
