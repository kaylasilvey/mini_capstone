class Api::OrdersController < ApplicationController
  before_action :authenticate_user

  def create
    product = Product.find_by(id: params["product_id"])
    subtotal_equation = product.price * params["quantity"].to_i
    tax_equation = product.tax * params["quantity"].to_i
    total_equation = product.total * params["quantity"].to_i

    @order = Order.new(
      user_id: current_user.id,
      product_id: params["product_id"],
      quantity: params["quantity"],
      subtotal: subtotal_equation,
      tax: tax_equation,
      total: total_equation,
    )
    if @order.save
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
