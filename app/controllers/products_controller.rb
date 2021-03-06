class ProductsController < ApplicationController


  def new
    @product = Product.new
  end

  def index
    @products = Product.all
  end


  def create
    product = Product.create(product_params)
    redirect_to products_path
  end


  def description
    product = Product.find(params[:id])
    render plain: product.description
  end

  def inventory
    product = Product.find_by(id: params[:id])
    if product.inventory == 0
      result = false
    else
      result = true
    end
    render plain: result
  end


  private

  def product_params
    params.require(:product).permit(:name, :inventory)
  end




end
