class ProductsController < ApplicationController
  def index
    @products = Product.all
    render "index.html.erb"
  end

  def show
    @product = Product.find_by(id: params[:id])
    render "show.html.erb"
  end

  def new
    @supplier = Supplier.all
    render "new.html.erb"
  end

  def create
    @product = Product.new(
      id: params["id"],
      name: params["name"],
      price: params["price"],
      description: params["description"],
      supplier_id: params["supplier_id"],
    )
    if @product.save
      Image.create(
        url: params[:image_url],
        product_id: @product.id,
      )
      render "show.html.erb"
    else
      render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def edit
    @product = Product.find_by(id: params[:id])
    @supplier = Supplier.all
    render "edit.html.erb"
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.name = params[:name]
    @product.price = params[:price]
    @product.description = params[:description]
    @product.supplier_id = params[:supplier_id]
    @product.save
    redirect_to "/products/#{@product.id}"
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    redirect_to "/products"
  end

  def image_url
    if images.length > 0 && images[0].url
      images[0].url
    else
      "https://www.hutchinsontires.com/helpers/img/no_image.jpg"
    end
  end
end
