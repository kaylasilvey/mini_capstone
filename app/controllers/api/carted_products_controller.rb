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
    @carted_products = CartedProduct.where(user_id: current_user.id)
    render "index.json.jb"
  end
end
