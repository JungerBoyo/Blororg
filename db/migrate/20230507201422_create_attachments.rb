class CreateAttachments < ActiveRecord::Migration[7.0]
  def change
    create_table :attachments do |t|
      t.binary :data

      t.timestamps
    end
  end
end
