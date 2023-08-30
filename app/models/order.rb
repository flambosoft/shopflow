class Order < ApplicationRecord
  has_many :order_statues

  has_many :order_items

  has_many :coupon_users
  
end
