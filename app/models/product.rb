class Product < ApplicationRecord
  has_many :category_products
  has_many :categories, through: :category_products
  has_many :images
  has_many :orders
  has_many :carted_products
  # validates :name, presence: true
  # validates :name, uniqueness: true
  # validates :description, length: { in: 10..500 }
  # validates :price, presence: true
  # validates :price, numericality: { greater_than: 0 }
  belongs_to :supplier

  # def supplier
  #   Supplier.find_by(id: supplier_id)
  # end
  
  def is_discounted?
    if price > 10
      return false
    else
      return true
    end
  end

  def tax
    price * 0.09
  end  

  def total
    price + tax
  end
end