class Associations2 < ActiveRecord::Migration
  def change
  	 add_column :items, :repair_id, :int
  	 add_column :models, :item_id, :int
  	 create_table :prices do |t|
       t.integer :model_id
       t.integer :service_id
       t.integer :price

       t.timestamps
    end

  end
end
