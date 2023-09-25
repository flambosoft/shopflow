class Variant < ApplicationRecord
  belongs_to :product
  has_many :variant_values
  # has_many images

  validates :sku, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
