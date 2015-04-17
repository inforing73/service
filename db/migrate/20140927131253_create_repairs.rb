class CreateRepairs < ActiveRecord::Migration
  def change
    create_table :repairs do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
