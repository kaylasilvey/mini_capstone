class Api::OrdersController < ApplicationController
  before_action :authenticate_user

  def create
    carted_products = CartedProduct.where(user_id: current_user.id, status: "carted")

    subtotal = 0
    tax = 0
    total = 0
    i = 0

    while i < carted_products.length
      subtotal += carted_products[i].quantity * carted_products[i].product.price
      tax += carted_products[i].quantity * carted_products[i].product.tax
      total += carted_products[i].quantity * carted_products[i].product.total
      i += 1
    end

    # product = Product.find_by(id: params[:product_id])
    # subtotal_equation = product.price * params["quantity"].to_i
    # tax_equation = product.tax * params["quantity"].to_i
    # total_equation = product.total * params["quantity"].to_i

    @order = Order.new(
      user_id: current_user.id,
      subtotal: subtotal,
      tax: tax,
      total: total,
    )
    if @order.save
      i = 0
      while i < carted_products.length
        carted_products[i].status = "purchased"
        carted_products[i].order_id = @order.id
        carted_products[i].save
        i += 1
      end
      render json: { message: "Checkout complete" }
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
