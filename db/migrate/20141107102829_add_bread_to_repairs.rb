class AddBreadToRepairs < ActiveRecord::Migration
  def change
    add_column :repairs, :bread, :string
  end
end
