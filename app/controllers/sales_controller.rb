class SalesController < ApplicationController
  # before_action :set_sale, only: [:show]

  def index
    @sales = current_user.sales
    @user = current_user
  end

  def create
    # @sale = current_user.sales.build(sale_params.merge(coffee: @coffee))
    @coffee = Coffee.find(params[:coffee_id])
    @sale = Sale.new(user: current_user, coffee: @coffee)

    if @sale.save
      redirect_to sale_path(@sale), notice: 'Sale was successfully created.'
    else
      render coffee_path(coffee_id: @coffee.id), status: :unprocessable_entity
    end
  end

  def show
    @sale = Sale.find(params[:id])
  end

  # private

  # def set_sale
  #   @sale = Sale.find(params[:id])
  # end

  def sale_params
    params.require(:sales).permit(:coffee_id, :user_id)
  end
end


# Em rotas:  resources :sales, only: [:create, :update, :destroy, :show]
