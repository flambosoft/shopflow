class CreateListProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :list_products do |t|
      t.belongs_to :list, foreign_key: true, index:true
      #t.bigint :list_id, null:false
      t.belongs_to :product, foreign_key: true, index:true
      #t.bigint :product_id, null:false

      t.timestamps
    end
  end
end
