class ListProduct < ApplicationRecord

  belongs_to :products
  belongs_to :lists
end
