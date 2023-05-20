class SalesController < ApplicationController
  before_action :authenticate_user!

  def create
    @coffee = Coffee.find(params[:coffee_id])
    @sales
  end

  def index
      @sales = Sale.all
  end

  def new
      @sale = Sale.new
  end

  def create
      @sale = Sale.new(sale_params)
      if @sale.save
        redirect_to @sale, notice: "Sale created successfully."
      else
        render :new
      end
  end

  def show
      @sale = Sale.find(params[:id])
  end

  def edit
      @sale = Sale.find(params[:id])
  end

  def update
      @sale = Sale.find(params[:id])
    if @sale.update(sale_params)
      redirect_to @sale, notice: "Sale updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @sale = Sale.find(params[:id])
    @sale.destroy
    redirect_to sales_path, notice: "Sale deleted successfully."
  end
end

private

  def sale_params
    params.require(:sale).permit(:user_id, :coffee_id)
  end

  def set_coffee_and_user
    @coffees = Coffee.all
    @users = User.all
  end
