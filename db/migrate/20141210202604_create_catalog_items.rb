class CreateCatalogItems < ActiveRecord::Migration
  def change
    create_table :catalog_items do |t|
      t.string :title
      t.string :description
      t.integer :category_id
      t.integer :price

      t.timestamps
    end
  end
end
