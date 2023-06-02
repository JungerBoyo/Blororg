class SwitchToCategoryById < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :category_id, :integer
    remove_column :posts, :category
  end
end
