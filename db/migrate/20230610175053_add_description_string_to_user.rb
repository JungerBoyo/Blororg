class AddDescriptionStringToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :description, :string
  end
end
