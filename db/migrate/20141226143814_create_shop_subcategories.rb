class CreateShopSubcategories < ActiveRecord::Migration
  def change
    create_table :shop_subcategories do |t|
      t.string :name

      t.timestamps
    end
  end
end
