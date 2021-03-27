class Api::OrdersController < ApplicationController
  before_action :authenticate_user
  
  def index
    
    
    # @orders = Order.where(user_id: current_user.id)
    @orders = current_user.orders
    # @orders = Order.all
    render 'index.json.jb'
  end
  
  def show
    # p "current_user"
    # p current_user
    # p "current_user"

    # @order = Order.find_by(id: params[:id], user_id: current_user.id)
    @order = current_user.orders.find_by(id: params[:id])
    render 'show.json.jb'
  end
  
  
  def create
    # find out what is in the user's shoppping cart
    @carted_products = current_user.carted_products.where(status: "carted")
    # figure out how much each item costs (and how many)

    calculated_total = 0
    calculated_tax = 0
    @carted_products.each do |carted_product|
      calculated_total += carted_product.product.price * carted_product.quantity
      calculated_tax += carted_product.product.tax * carted_product.quantity
    end

    p "calculated_total"
    p calculated_total
    p "calculated_total"
    # add all those up
    # that's the subtotal
    
    @order = Order.new(
      user_id: current_user.id,
      subtotal: calculated_total,
      total: calculated_total + calculated_tax,
      tax: calculated_tax,      
    )
    @order.save

    @carted_products.each do |carted_product|
      carted_product.update(status: "purchased", order_id: @order.id)
    end

    
    # p @order.errors.full_messages
    render 'show.json.jb'
  end
end
