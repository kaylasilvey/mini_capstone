class Api::ProductsController < ApplicationController
  def uppers_and_downers_method
    @product = Product.first
    render "uppers_and_downers.json.jb"
  end
end
