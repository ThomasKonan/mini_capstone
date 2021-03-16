class Api::OrdersController < ApplicationController

  def create

    @carted_products = current_user.carted_products.where(status: "carted")

    calculated_total = 0
    calculated_tax = 0
    @carted_products.each do |carted_product|
    calculated_total += carted_product.product.price * carted_product.quantity
    calculated_tax += carted_product.product.tax * carted_product.quantity
    end
    p "calculated_total"
    p calculated_total
    p "calculated_total"

    @order = Order.new(
      user_id: current_user,id,
      subtotal: caulculated_total,
      total: calculated_total + tax
      tax: calculated_tax,
    )
    @order.save!

    @carted_products.each do |carteD_product|
    carted_product.update(status: "purchased". order_id: @order.id)
    p @order.errors.full_messages
    render 'show.json.jb'
  end
end