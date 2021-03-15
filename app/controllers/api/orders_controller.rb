class Api::OrdersController < ApplicationController

  def index
    render "index.json.jb"
  end

  def create
    p "current_user"
    p current_user
    p "current_user"

    subtotal == quantity * price
    product = Product.find_by(id: params[]:product_id])
    calculated_subtotal = params[:quantity].to_i * product.price
    calculated_tax= calculated_subtotal 8 0.09 
    calculated_total = calculated_subtotal + calculated _tax

    @order = Order.new(
    id: params
    product_id: params[:product_id]
    user_id: 1
    quantity: @params[:quantity]
    subtotal:
    tax: 
    total: 
  )

  @order.save!
  render 'show.json.jb'
  end
end
