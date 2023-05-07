class CreateAttachmentProxies < ActiveRecord::Migration[7.0]
  def change
    create_table :attachment_proxies do |t|
      t.string :name
      t.integer :type
      t.references :attachable, polymorphic: true, null: false
      t.references :attachment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
