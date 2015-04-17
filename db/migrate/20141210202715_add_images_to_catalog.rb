class AddImagesToCatalog < ActiveRecord::Migration
  def change
  	add_attachment :catalog_categories, :image
  end
end
