class CreateHistoryItems < ActiveRecord::Migration[6.1]
  def change
    create_table :history_items do |t|
      t.string :history_type, null: false
      t.string :target_type, null: false
      t.integer :target_id, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
