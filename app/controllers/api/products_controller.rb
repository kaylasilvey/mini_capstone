class Api::ProductsController < ApplicationController
  def show
    @product = Product.find_by(id: params["id"])
    render "show.json.jb"
  end

  def index
    @products = Product.all

    if params[:search]
      @products = @products.where("name ILIKE ?", "%#{params[:search]}%")
    end

    if params[:discount]
      @products = @products.where("price <= ?", 10)
    end

    if params[:sort] == "price" && params[:sort_order] == "asc"
      @products = @products.all.order(:price)
    elsif params[:sort] == "price" && params[:sort_order] == "desc"
      @products = @products.all.order(:price => :desc)
    else
      @products = @products.order(id: :asc)
    end

    render "index.json.jb"
  end

  def create
    @product = Product.new(
      id: params["id"],
      name: params["name"],
      price: params["price"],
      image_url: params["image_url"],
      description: params["description"],
    )
    if @product.save
      render "show.json.jb"
    else
      render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @product = Product.find_by(id: params["id"])
    @product.name = params["name"] || @product.name
    @product.price = params["price"] || @product.price
    @product.image_url = params["image_url"] || @product.image_url
    @product.description = params["description"] || @product.description
    if @product.save
      render "show.json.jb"
    else
      render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @product = Product.find_by(id: params["id"])
    @product.destroy
    render json: { message: "Product successfully destroyed.  Hope you knew what you were doing!" }
  end

  # def product_query_method
  #   product = params["id"].to_i
  #   @product = Product.find_by(id: product)
  #   render "uppers_and_downers.json.jb"
  # end

  # def uppers_and_downers_method
  #   @product = Product.first
  #   render "uppers_and_downers.json.jb"
  # end

  # def whiskey_method
  #   @product = Product.second
  #   render "uppers_and_downers.json.jb"
  # end

  # def heart_butt_method
  #   @product = Product.third
  #   render "uppers_and_downers.json.jb"
  # end

  # def trash_queen_method
  #   @product = Product.fourth
  #   render "uppers_and_downers.json.jb"
  # end

  # def home_sweet_method
  #   @product = Product.fifth
  #   render "uppers_and_downers.json.jb"
  # end

  # def crystal_heart_method
  #   @product = Product
  #   render "uppers_and_downers.json.jb"
  # end

  # def death_of_magic_method
  #   @product = Product.last
  #   render "uppers_and_downers.json.jb"
  # end
end
