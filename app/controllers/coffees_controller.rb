class CoffeesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index
    @coffees = Coffee.all
  end

  def show
    @coffees = Coffee.find(params[:id])
  end


  

end
