class CreateVariants < ActiveRecord::Migration[7.0]
  def change
    create_table :variants do |t|
      t.string :sku
      t.decimal :price
      t.integer :inventory_count
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end

    add_index :variants, :sku, unique: true

  end
end
