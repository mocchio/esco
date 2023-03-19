class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :name,          null: false
      t.integer :level_id,     null: false
      t.string :habit,         null: false
      t.text :rule,            null: false

      t.timestamps
    end
  end
end
