class AddArticleToCatalog < ActiveRecord::Migration
  def change
  	add_column :catalog_items, :article, :integer
  end
end
