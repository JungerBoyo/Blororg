class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title, limit: 128
      t.string :contents
      t.boolean :is_private

      t.timestamps
    end
  end
end
