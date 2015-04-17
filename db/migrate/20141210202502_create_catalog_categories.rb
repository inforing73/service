class CreateCatalogCategories < ActiveRecord::Migration
  def change
    create_table :catalog_categories do |t|
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
