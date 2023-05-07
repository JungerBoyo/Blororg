class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title, limit: 128
      t.string :contents
      t.references :category, null: false, foreign_key: true
      t.integer :karma
      t.boolean :is_private
      t.references :author, null: false, foreign_key: true

      t.timestamps
    end
  end
end
