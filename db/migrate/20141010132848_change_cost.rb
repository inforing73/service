class ChangeCost < ActiveRecord::Migration
  def change
  	change_column :prices, :cost, :string
  end
end
