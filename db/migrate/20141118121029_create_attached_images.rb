class CreateAttachedImages < ActiveRecord::Migration
  def change
    create_table :attached_images do |t|

      t.timestamps
    end
  end
end
