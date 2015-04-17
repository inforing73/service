class AddImageToRepairs < ActiveRecord::Migration
  def self.up
    add_attachment :repairs, :image
  end

  def self.down
    remove_attachment :repairs, :image
  end
end
