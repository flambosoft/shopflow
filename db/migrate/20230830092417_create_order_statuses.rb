class CreateOrderStatuses < ActiveRecord::Migration[7.0]
  def change
    create_table :order_statuses do |t|
      t.belongs_to :order, foreign_key: true, index:true
      #t.integer :order_id, null:false
      t.string :status, null: false
      t.text :comment
      t.belongs_to :admin, foreign_key: true, index:true
      #t.integer :admin_id

      t.timestamps
    end
  end
end
