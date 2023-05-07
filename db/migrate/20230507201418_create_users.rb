class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :nick, limit: 50
      t.string :emial, limit: 50
      t.string :description
      t.string :password_hash
      t.string :private_context_password_hash
      t.boolean :admin

      t.timestamps
    end
    add_index :users, :nick, unique: true
    add_index :users, :emial, unique: true
    add_index :users, :admin
  end
end
