class Rename < ActiveRecord::Migration
  def change
  	rename_column :catalog_items, :category_id, :catalog_category_id
  end
end
