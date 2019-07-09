class Api::ProductsController < ApplicationController
  before_action :authenticate_admin, except: [:index, :show]

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
      #image: params["image_url"],
      description: params["description"],
      supplier_id: params["supplier_id"],
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
    #@product.image_url = params["image_url"] || @product.image_url
    @product.description = params["description"] || @product.description
    @product.supplier_id = params["supplier_id"] || @product.supplier_id
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
end
