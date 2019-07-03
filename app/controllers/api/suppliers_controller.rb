class Api::SuppliersController < ApplicationController
  def show
    @supplier = Supplier.find_by(id: params["id"])
    render "show.json.jb"
  end

  def index
    @suppliers = Supplier.all
    render "index.json.jb"
  end

  def create
    @supplier = Supplier.new(
      id: params["id"],
      name: params["name"],
      email: params["email"],
      phone_number: params["phone_number"],
    )
    if @supplier.save
      render "show.json.jb"
    else
      render json: { errors: @supplier.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @supplier = Supplier.find_by(id: params["id"])
    @supplier.name = params["name"] || @supplier.name
    @supplier.email = params["email"] || @supplier.email
    @supplier.phone_number = params["phone_number"] || @supplier.phone_number
    if @supplier.save
      render "show.json.jb"
    else
      render json: { errors: @supplier.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @supplier = Supplier.find_by(id: params["id"])
    @supplier.destroy
    render json: { message: "Supplier successfully destroyed.  Hope you knew what you were doing!" }
  end
end
