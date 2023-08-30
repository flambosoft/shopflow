class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :body
      t.integer :rating, default: 1
      t.boolean :enabled, default: false
      t.belongs_to :user, foreign_key: true, index:true
      #t.bigint :user_id, null: false
      t.belongs_to :product, foreign_key: true, index:true
      #t.bigint :product_id, null: false


      t.timestamps
    end
  end
end
