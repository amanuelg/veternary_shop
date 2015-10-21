class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name
      t.string :pet_type
      t.string :breed
      t.integer :age
      t.float :weight
      t.datetime :last_visit_date
      t.integer :customer_id

      t.timestamps null: false
    end
  end
end
