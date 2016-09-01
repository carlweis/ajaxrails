class ProductsController < ApplicationController
  helper_method :sort_column, :sort_direction
  before_action :set_product, only: [:show, :edit, :destroy]
  before_action :search_products, only: [:index]

  def index
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = 'Successfully updated product.'
      redirect_to @product
    else
      render :action => 'edit'
    end
  end

  def destroy
    @product.destroy
    flash[:notice] = 'Successfully destroyed product.'
    redirect_to products_url
  end

  private
    def product_params
      params.require(:product)
        .permit(:name, :cost, :price, :quantity,
                :description, :state, :released_at)
    end

    def set_product
      @product = Product.find_by_id(params[:id])
    end

    def search_products
     @products = Product.search(params[:search])
                        .order(sort_column + ' ' + sort_direction)
                        .page(params[:page]).per(10)
    end

    def sort_column
      Product.column_names.include?(params[:sort]) ? params[:sort] : 'released_at'
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
    end
end
