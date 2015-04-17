class Add < ActiveRecord::Migration
  def self.up
    add_attachment :attached_images, :image
  end

  def self.down
    remove_attachment :attached_images, :image
  end
end
