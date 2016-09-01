class ProductsController < ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    @products = Product.search(params[:search]).order(sort_column + ' ' + sort_direction)
                        .page(params[:page]).per(10)
  end

  def show
    @product = Product.find_by_id(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params[:product])
    if @product.save
      flash[:notice] = 'Successfully updated product.'
      redirect_to @product
    else
      render :action => 'edit'
    end
  end

  def destroy
    @product = Product.find_by_id(params[:id])
    @product.destroy
    flash[:notice] = 'Successfully destroyed product.'
    redirect_to products_url
  end

  private

    def sort_column
      Product.column_names.include?(params[:sort]) ? params[:sort] : 'released_at'
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
    end
end
