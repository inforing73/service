class RenamePrice2 < ActiveRecord::Migration
  def change
  	rename_column :prices, :price, :cost
  end
end
