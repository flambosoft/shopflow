class ProductCharacteristic < ApplicationRecord

  belongs_to :products
  belongs_to :characteristics

end
