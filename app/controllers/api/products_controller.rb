class Api::ProductsController < ApplicationController
  def product_url_method
    @product = Product.find_by(id: params["product_url"].to_i)
    render "uppers_and_downers.json.jb"
  end

  def product_query_method
    product = params["id"].to_i
    @product = Product.find_by(id: product)
    render "uppers_and_downers.json.jb"
  end

  def all_products_method
    @products = Product.all
    render "all_products.json.jb"
  end

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
