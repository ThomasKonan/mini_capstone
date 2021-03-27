class Api::ProductsController < ApplicationController
  before_action :authenticate_admin, only: [:destroy, :create, :update]
  # before_action :authenticate_admin, except: [:show, :index]

  def index
    # if params[:discount] == "true"
    #   @products = Product.where("price < 10")
    # elsif params[:sort] && params[:sort_order]
    #   @products = Product.order({params[:sort] => params[:sort_order]})
    # # elsif params[:sort] == "price" && params[:sort_order] == "desc"
    # #   @products = Product.order({price: :desc})
    # # elsif params[:sort] == "price" && params[:sort_order] == "asc"
    # #   @products = Product.order({price: :asc})
    # else
    #   @products = Product.all
    # end

    if params[:category]
      # find the category
      category = Category.find_by(name: params[:category])
      # find all the products in that category
      @products = category.products
    else
      @products = Product.all
    end

    # highest to lowest price
    # @products = Product.order({price: :desc})

    # lowest to highest
    # @products = Product.order({price: :asc})

    # discounted
    # @products = Product.where("price < 10")

    # no params/all

    render "index.json.jb"
  end

  def create
    @product = Product.new(
      name: params[:name],
      price: params[:price],
      image_url: params[:image_url],
      description: params[:description],
    )
    if @product.save
      # happy path
      render "show.json.jb"
    else
      # sad path
      # show them some errors
      render json: { errors: @product.errors.full_messages }
    end
    # take in some parameters
    # save that data to the db
    # show the user the newly made product
  end

  def show
    # get data from the db
    the_id = params[:id]
    @product = Product.find_by(id: the_id)
    # show thaat data to the user
    render "show.json.jb"
  end

  def update
    # finding a product from the db
    @product = Product.find_by(id: params[:id])
    # changing an attribute
    @product.description = params[:description]
    @product.price = params[:price]
    @product.image_url = params[:image_url]
    @product.name = params[:name]
    # applying those chaanges to the db
    @product.save
    render "show.json.jb"
  end

  def destroy
    # figure out which product to delete
    @product = Product.find_by(id: params[:id])
    @product.destroy
    # delete that product
    render json: { message: "product has been removed" }
  end
end
