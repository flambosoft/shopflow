class CreateCoupons < ActiveRecord::Migration[7.0]
  def change
    create_table :coupons do |t|
      t.string :code, null: false
      t.integer :percent, null: false
      t.string :coupon_type
      t.date :expiry_date
      t.boolean :enabled, default: true
      t.string :description, default: "", null: false
      t.string :description_ar
      t.integer :validity

      t.timestamps
    end
  end
end
