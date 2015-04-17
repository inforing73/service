class CreateShopItems < ActiveRecord::Migration
  def change
    create_table :shop_items do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.integer :article
      t.integer :count

      t.timestamps
    end
  end
end
