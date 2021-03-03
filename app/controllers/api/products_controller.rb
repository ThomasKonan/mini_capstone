class Api::ProductsController < ApplicationController
  def index
    @product = Product.all
    render "index.json.jb"
  end

  def create
    @product = Product.new(
      name: params[:name],
      price: params[:price],
      image_url: params[:image_url],
      description: params[:description],
    )
    @product.save
    render "show.json.jb"
  end

  def show
    # get the data from the db
    the_id = params[:id]
    @product = Product.find_by(id: the_id)
    #  show that data to the user
    render "show.json.jb"
  end

  def update
    # finding a product from the db
    @product = Product.find_by(id: 1)
    # changing an attribute
    @product.price = params[:price]
    @product.description = params[:description]
    @product.image_url = params[:image_url]
    @product.name = params[:name]
    # applying those changes to the db
    @product.save
  end

  def destroy
    # figure out what product to delete
    @product = Product.find_by(id: params[:id])
    render json: { message: "product has been removed" }
    @product.destroy
  end
end
