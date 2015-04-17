class CreateShopTrees < ActiveRecord::Migration
  def change
    create_table :shop_trees do |t|
      t.string :name

      t.timestamps
    end
  end
end
