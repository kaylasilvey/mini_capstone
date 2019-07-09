class Api::OrdersController < ApplicationController
  def create
    order = Order.new(
      user_id: current_user.id,
      product_id: params["product_id"],
      quantity: params["quantity"],
      subtotal: Product.find_by(id: params["product_id"]).price,
      tax: Product.find_by(id: params["product_id"]).price * 0.105,
      total: Product.find_by(id: params["product_id"]).price + Product.find_by(id: params["product_id"]).price * 0.105,
    )
    if order.save
      render json: { message: "Order added to cart" }
    else
      render json: { errors: order.errors.full_messages }, status: :bad_request
    end
  end

  def index
    @orders = current_user.orders
    render "index.json.jb"
  end

  def show
    @order = current_user.orders.find_by(id: params[:id])
    render "show.json.jb"
  end
end
