class Api::CartedProductsController < ApplicationController
  def index
    @carted_products = CartedProduct.where(user_id: current_user.id)
    @carted_products = @carted_products.where(status: "carted")
    render "index.json.jb"
  end

  def create
    @carted_product = CartedProduct.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: "carted",
    )
    @carted_product.save
    render "show.json.jb"
    # render json: { message: "product has been added to cart" }
  end

  def destroy
    @carted_product = Product.find_by(id: params[:id])
    render json: { message: "Item removed from cart" }
  end
end
