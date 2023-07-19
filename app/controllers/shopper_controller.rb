class ShopperController < ApplicationController
  include CurrentCart
  before_action :set_cart
  skip_before_action :authorize
  def index
    if params[:search]
      search_str = '%' + params[:search] + '%'
      result1 = Product.where('name like ?', search_str).order(:name)
      result2 = Product.where('description like ?', search_str).order(:description)
      result3 = Product.where('price like ?', search_str).order(:price)
      result = result1 + result2 + result3
      @products = result.uniq
    else
      @products = Product.order(:name)
    end
  end
end
