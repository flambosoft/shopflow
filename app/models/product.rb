class Product < ApplicationRecord

  has_many :product_options
  has_many :options, through: :product_options
  has_many :variants

  has_many :category_products
  has_many :categories, through: :category_products

  has_many :list_products, dependent: :destroy
  has_many :lists, through: :list_products

  has_many :reviews

  has_many :product_characteristics
  has_many :characteristics, through: :product_characteristics

  validates :name, presence: true, uniqueness: true
  
end
