class CreateCategoryProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :category_products, id: false do |t|
      t.belongs_to :category, foreign_key: true, index:true
      #t.bigint :category_id, null: false
      t.belongs_to :product, foreign_key: true, index:true
      #t.bigint :product_id, null: false

      t.timestamps
    end
  end
end
