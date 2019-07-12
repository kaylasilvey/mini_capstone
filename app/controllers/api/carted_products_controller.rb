class Api::CartedProductsController < ApplicationController
  def create
    @carted_products = CartedProduct.new(
      product_id: params[:product_id],
      quantity: params[:quantity],
      user_id: current_user.id,
      status: "carted",
    )
    @carted_products.save
    render "show.json.jb"
  end

  def index
    @carted_products = CartedProduct.where(user_id: current_user.id, status: "carted")
    render "index.json.jb"
  end

  def destroy
    @carted_products = CartedProduct.find_by(user_id: current_user.id, product_id: params[:id])
    @carted_products.status = "removed"
    @carted_products.save
    render json: { message: "Product removed from cart" }
  end
end
