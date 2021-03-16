class ProductCategory < ApplicationRecord
  belongs_to: category
  belongs_to: product
  has_many: product
end
