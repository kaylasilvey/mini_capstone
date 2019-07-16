class ProductsController < ApplicationController
  def index
    @products = Product.all
    #put images model link in controller to access images in the index/show/new
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
      name: params["name"],
      price: params["price"],
      description: params["description"],
      supplier_id: params["supplier_id"],
    )
    @product.save
    redirect_to "/products/#{@product.id}"
  end
end
