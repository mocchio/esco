class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.text :content
      t.datetime :start_time
      t.references :room,      null: false
      t.references :user,      null: false

      t.timestamps
    end
  end
end
