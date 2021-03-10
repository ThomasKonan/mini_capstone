class Api::ProductsController < ApplicationController
  def index
    products = Product.all
    render "index.json.jb"
    # if params[:discount] == "true"
    #   @products = Product.where("price < 10")
    # elsif params[:sort] && params[:sort_order]
    #   @products = Product.order({ params[:sort] => params[:sort_order] })
    #   # elsif params[:sort] == "price" && params[:sort_order == "desc"
    #   #   @products= Product.order({price: :desc})
    #   # elsif params[:sort] == "price" && params[: sort_order] = "asc"
    #   #   @products= Product.order({price: :asc})
    #   # else
    #   #   @products = Product.all
    #   # end
    #   #   @products = Product.all
    #   # render "index.json.jb"

    #   highest to lowest price
    #   @products = Product.order({ price: :desc })

    #   lowest to highest
    #   @products = Product.order({ price: :asc })

    #   discounted
    #   @products = Product.where ("price < 10")
    # end
  end

  def create
    @products = Product.new(
      name: params[:name],
      price: params[:price],
      image_url: params[:image_url],
      description: params[:description],
      is_discounted: params[:is_discounted],
    )
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
    @product.is_discounted = params[:is_discounted]
    # applying those changes to the db
    @product.save
  end

  def destroy
    # figure out what product to delete
    @product = Product.find_by(id: params[:id])
    @product.destroy
    render json: { message: "product has been removed" }
  end
end
