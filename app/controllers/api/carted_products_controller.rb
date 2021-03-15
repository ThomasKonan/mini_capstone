class Api::CartedProductsController < ApplicationController
  def index
    @carted_product = CartedProduct.find_by()
  end

  def create
    @carted_product = CartedProduct.new(
      user_id: 1,
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: "carted",
    )
    @carted_product.save
    render "show.json.jb"
    # render json: { message: "product has been added to cart" }
  end
end
