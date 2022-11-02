class AddTimeStampToInventory < ActiveRecord::Migration[7.0]
  def change
    add_column :inventories, :timestamp, :time
  end
end
