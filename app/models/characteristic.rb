class Characteristic < ApplicationRecord

  has_many :product_characteristics
  has_many :products, through: :product_characteristics

end
