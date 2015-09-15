class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :name, null: false
      t.text :description
      t.integer :property_id

      t.timestamps null: false
    end
  end
end
