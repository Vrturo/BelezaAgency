class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.belongs_to :user, index: true
      t.string :filename
      t.string :content_type
      t.binary :file_contents

      t.timestamps
    end
  end

end
