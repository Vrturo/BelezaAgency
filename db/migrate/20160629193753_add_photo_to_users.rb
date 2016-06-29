class AddPhotoToUsers < ActiveRecord::Migration
  def self.up
    add_attachment :users, :photo_one
    add_attachment :users, :photo_two
    add_attachment :users, :photo_three
    add_attachment :users, :photo_four
  end

  def self.down
    remove_attachment :users, :photo_one
    remove_attachment :users, :photo_two
    remove_attachment :users, :photo_three
    remove_attachment :users, :photo_four
  end
end
