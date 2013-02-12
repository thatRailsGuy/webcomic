class AddAttachmentImageToComics < ActiveRecord::Migration
  def self.up
    change_table :comics do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :comics, :image
  end
end
