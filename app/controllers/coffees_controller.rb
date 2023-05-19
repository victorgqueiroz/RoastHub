class CoffeesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @coffees = Coffee.all
  end

  def show
    @coffee = Coffee.find(params[:id])
  end

  def new
    @coffee = Coffee.new
  end

  def create
    @coffee = Coffee.new(coffee_params)
    @coffee.user = current_user
    if @coffee.save
      redirect_to coffee_path(@coffee)
    else
      render :new
    end
  end

  def edit
    @coffee = Coffee.find(params[:id])
  end

  def update
    @coffee = Coffee.find(params[:id])
    if @coffee.update(coffee_params) #caso user prop do café permitir update
      redirect_to coffee_path(@coffee)
    else
      render :edit
    end
  end

  def destroy
    @coffee = Coffee.find(params[:id])
    @coffee.destroy
    redirect_to root_path, status: :see_other
  end

  def my
    @coffees = Coffee.where(user: current_user)
  end

  private

  def coffee_params
    params.require(:coffee).permit(:brand, :description, :region, :price, :roast, :sensory_note, :classification, :grinding, :bean)
  end
end
