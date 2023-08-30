class CreateCouponUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :coupon_users do |t|
      t.belongs_to :coupon, foreign_key: true, index:true
      #t.bigint :coupon_id, null: false
      t.belongs_to :user, foreign_key: true, index:true
      #t.bigint :user_id, null:false
      t.belongs_to :order, foreign_key: true, index:true
      #t.bigint :order_id, null: false
      t.boolean :active, default: false

      t.timestamps
    end
  end
end
