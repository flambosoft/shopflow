class ProductOption < ApplicationRecord
  belongs_to :product
  belongs_to :option

  validates :product_id, uniqueness: { scope: :option_id }
end
