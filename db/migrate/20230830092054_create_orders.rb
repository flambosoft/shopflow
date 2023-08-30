class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.belongs_to :user, foreign_key: true, index: true
      # t.bigint :user_id, null:false
      t.integer :amount
      t.string :status
      t.boolean :validated, default: false
      t.text :informations

      t.timestamps
    end
  end
end
