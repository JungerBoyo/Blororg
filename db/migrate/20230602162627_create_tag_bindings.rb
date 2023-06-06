class CreateTagBindings < ActiveRecord::Migration[7.0]
  def change
    create_table :tag_bindings do |t|
      t.belongs_to :post
      t.belongs_to :tag
      t.timestamps
    end
  end
end
