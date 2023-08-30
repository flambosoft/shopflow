class CreateProductCharacteristics < ActiveRecord::Migration[7.0]
  def change
    create_table :product_characteristics do |t|
      t.belongs_to :product, foreign_key: true, index:true
      #t.bigint :product_id, null:false
      t.belongs_to :characteristic, foreign_key: true, index:true
      #t.bigint :characteristic_id, null:false
      t.string :value, null:false

      t.timestamps
    end
  end
end
