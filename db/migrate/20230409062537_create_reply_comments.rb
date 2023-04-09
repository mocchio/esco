class CreateReplyComments < ActiveRecord::Migration[6.0]
  def change
    create_table :reply_comments do |t|
      t.text :reply_text,             null: false
      t.references :user,             null: false, foreign_key: true
      t.references :room,             null: false, foreign_key: true
      t.references :comment,          null: false, foreign_key: true

      t.timestamps
    end
  end
end
