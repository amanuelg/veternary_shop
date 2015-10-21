class CreateDoctors < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip_code
      t.string :schoo_graduated
      t.integer :years_in_practice
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
