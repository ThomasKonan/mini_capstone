class Api::OrdersController < ApplicationController
  def create
  order = Order.new(
    user_id: params[:user_id]
    productid: params[:product_id]
    subtotal: params[:subtotal]
    tax: params[:tax]
    total: params[:total]
  )
  end
end
