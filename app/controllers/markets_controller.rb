class MarketsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
      @coffees = Coffee.global_search(params[:query])
      @coffees = Coffee.all if @coffees.empty?
  end
end
