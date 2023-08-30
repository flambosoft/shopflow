class CreateOderItems < ActiveRecord::Migration[7.0]
  def change
    create_table :oder_items do |t|
      t.belongs_to :order, foreign_key: true, index:true
      #t.bigint :order_id, null: false
      t.integer :quantity, null: false, default: 1
      t.integer :price, null: false, default: 0
      t.integer :orderable_id, null: false
      t.text :orderable_type

      t.timestamps
    end
  end
end
