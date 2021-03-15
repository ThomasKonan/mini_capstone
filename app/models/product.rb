class Product < ApplicationRecord
  has_many :category_products
  has_many :categories, through :category_productsimages
  belongs_to :orders
  belongs_to :carted_products
end

# validates :name, presence: true
# validates :description, length: { in: 10..500 }
# validates :price, presence: true
# validates :price, numericality: { greater_than: 0 }

# belongs_to:
# has_many:

# def supplier_id
# Supplier.find_by(id: supplier_id)
