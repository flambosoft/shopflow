class Product < ApplicationRecord

  has_many :category_products
  has_many :categories, through: :category_products

  has_many :list_products, dependent: :destroy
  has_many :lists, through: :list_products

  has_many :reviews

  has_many :product_characteristics
  has_many :characteristics, through: :product_characteristics
  
end
