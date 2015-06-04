class HomeController < ApplicationController
  def index
    Product.populate_products
    @products = Product.search_by_brand_or_type(params[:search])
  end
end
