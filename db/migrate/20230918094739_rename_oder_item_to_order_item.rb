class RenameOderItemToOrderItem < ActiveRecord::Migration[7.0]
  def change
    rename_table :oder_items, :order_items
  end
end
