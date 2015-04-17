class AddIdToImage < ActiveRecord::Migration
  def change
  	add_column :attached_images, :catalog_item_id, :integer
  	change_column :catalog_items, :description, :text
  end
end
